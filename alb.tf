resource "aws_lb" "jk-lb" {
  name               = "test-lb"
  load_balancer_type = "application"
  security_groups    = [aws_security_group.jk-sg.id]
  subnets            = [module.vpc.public_subnets[0],module.vpc.public_subnets[1]]

  enable_deletion_protection = false
}

resource "aws_lb_listener" "lb_listner" {
  load_balancer_arn = aws_lb.jk-lb.id
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "redirect"

    redirect {
      port        = "443" 
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}



resource "aws_lb_target_group" "target-group" {
  name     = "jk-tg1"
  port     = 8080
  protocol = "HTTP"
  vpc_id   = module.vpc.vpc_id
}

resource "aws_lb_target_group_attachment" "test" {
  target_group_arn = aws_lb_target_group.target-group.arn
  target_id        = aws_instance.jk-inst1.id
  port             = 8080
  depends_on = [ aws_instance.jk-inst1 ]
}

resource "aws_lb_target_group" "target-group2" {
  name     = "app"
  port     = 3000
  protocol = "HTTP"
  vpc_id   = module.vpc.vpc_id
}

resource "aws_lb_target_group_attachment" "test2" {
  target_group_arn = aws_lb_target_group.target-group2.arn
  target_id        = aws_instance.jk-inst1.id
  port             = 3000
  depends_on = [ aws_instance.jk-inst1 ]
}

resource "aws_lb_listener" "https-listener" {
  load_balancer_arn = aws_lb.jk-lb.arn
  port              = "443"
  protocol          = "HTTPS"
#   ssl_policy        = "ELBSecurityPolicy-2016-08"

  certificate_arn   = "arn:aws:acm:us-east-2:699475925558:certificate/90f25ec1-5f75-4444-bad6-ec942ae954cf"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target-group.arn
  }
}






