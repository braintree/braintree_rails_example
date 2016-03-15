function Demo(config){
  this.config = config;
  this.config.development = config.development || false;

  this.bt = $('.braintree');
  this.paymentForm = $('#' + config.formID);
  this.inputs = $('input[type=text], input[type=email], input[type=tel]');
  this.button = this.paymentForm.find('.button');
  this.checkout = $('.checkout');
  this.success = $('.success');
  this.hashLinks = $('a[href^=#]');
  this.successView = window.location.origin + '/' + this.paymentForm.attr('action');

  console.log(this.hashLinks);

  this.states = {
    'show' : 'active',
    'wait' : 'loading'
  };
  this.focusClass = "has-focus";
  this.valueClass = "has-value";
  this.transitionend = 'webkitTransitionEnd otransitionend oTransitionEnd msTransitionEnd transitionend';

  this.initialize();
}


Demo.prototype.initialize = function(){
  var self = this;

  this.events();
  this.inputs.each(function(index, element){
    self.labelHander($(element));
  });
};


Demo.prototype.events = function(){
  var self = this;

  this.paymentForm.on('submit', function(event){
    self.process(event);
  });

  this.hashLinks.on('click', function(event){
    console.log('hashLinks element clicked');
    self.resetCheckout(event);
  });

  this.inputs.on('focus', function(){
      $(this).closest('label').addClass(self.focusClass);
      self.labelHander($(this));
    }).on('keydown', function(){
      self.labelHander($(this));
    }).on('blur', function(){
      $(this).closest('label').removeClass(self.focusClass);
      self.labelHander($(this));
  });

  $(document).on( 'payment', function(event, status){
    if (status === 'success') {
      self.bt.addClass('active');
      self.confirmation();
    } else {
      self.bt.removeClass('active');
      self.notify(status);
    }
  });

  $(document).keyup(function(event) {
    if (event.keyCode === 27) self.resetCheckout(event);
  });
};


Demo.prototype.labelHander = function(element){
  var self = this;
  var input = element;
  var label = input.closest('label');

  window.setTimeout(function(){
    var hasValue = (input.val().length > 0) ? true : false ;

    if (hasValue) {
      label.addClass(self.valueClass);
    } else {
      label.removeClass(self.valueClass);
    }
  }, 10);
};


Demo.prototype.notify = function(status){
  var self = this;
  var notice = $('.notice-' + status );
  var delay = (this.config.development === true) ? 2000 : 0;

  notice.show()

  window.setTimeout(function(){
    notice.addClass('show');
    self.button.removeClass(self.states.wait);

    window.setTimeout(function(){
      notice.removeClass('show');
      window.setTimeout(function(){
        notice.hide();
      }, 310);
    }, delay);
  }, 10);
};


Demo.prototype.process = function(event){
  var self = this;
  var json = this.getFormJSON(self.paymentForm);
  var callback = this.config.onPurchase;
  var delay = (this.config.development === true) ? 1000 : 0;

  event.preventDefault();
  self.bt.addClass('active');
  self.button.addClass(self.states.wait);

  console.log(self.successView);

  window.setTimeout(function(){
    callback(json);
  }, delay);
};


Demo.prototype.confirmation = function(){
  var self = this;

  this.button.addClass('out').removeClass('pulse');
  this.checkout.removeClass(this.states.show).addClass('dismiss');
  this.success.addClass(this.states.show);

  window.setTimeout(function(){
    self.button.removeClass(self.states.wait);

    // window.location.pathname = 'success.html';

    window.location = self.successView;
  }, 500);
};


Demo.prototype.resetCheckout = function(event){
  event.preventDefault();

  this.button.removeClass('out').addClass('pulse');
  this.success.removeClass(this.states.show);
  this.checkout.addClass(this.states.show);
};


Demo.prototype.getFormJSON = function(form){
  var data = {};
  var fields = form.serializeArray();

  $.each(fields, function() {
    if (data[this.name] !== undefined) {
      if (!data[this.name].push) {
        data[this.name] = [data[this.name]];
      }
      data[this.name].push(this.value || '');
    } else {
      data[this.name] = this.value || '';
    }
  });

  return data;
};
