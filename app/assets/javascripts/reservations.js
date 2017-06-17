$(function() {
  $('#reservation_start_date, #reservation_end_date').datetimepicker({
    dayOfWeekStart : 1,
    lang:'en',
    step: 1
  });

  var calcDuration = {
    startDate: null,
    endDate: null,
    isAllDatesPresent: function() {
      return !!this.startDate && !!this.endDate
    },
    duration: function () {
      if (!this.endDate && !this.startDate) return "";

      var result = dateFns
        .differenceInMinutes(
          Date.parse(this.endDate),
          Date.parse(this.startDate)
        )

      return result > 0 ? result : 0;
    }
  };

  $('#reservation_start_date').on('change', function (event) {
    var $price = $("#reservation_price"),
        $finalPrice = $("#finalPrice");

    calcDuration.startDate = $(this).val();

    if (calcDuration.isAllDatesPresent()) {
      $finalPrice.text(calcDuration.duration() * Number($price.val()));
    } else {
      $finalPrice.text('0');
    }
  });

  $('#reservation_end_date').on('change', function (event) {
    var $price = $("#reservation_price"),
        $finalPrice = $("#finalPrice");

    calcDuration.endDate = $(this).val();

    if (calcDuration.isAllDatesPresent()) {
      $finalPrice.text(calcDuration.duration() * Number($price.val()));
    } else {
      $finalPrice.text('0');
    }
  });

});