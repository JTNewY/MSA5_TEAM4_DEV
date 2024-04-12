$(document).ready(function () {
    $('#datePicker').datepicker({
        format: "yyyy-mm-dd",
        startDate: '-10d',
        language: "ko"
    }).on("changeDate", function (e) {
        var selectedDate = e.format();
        loadOrderList(selectedDate);
    });
});

function loadOrderList(selectedDate) {
    $.ajax({
        url: "<%= request.getContextPath() %>/userManagement.jsp",
        method: "POST",
        data: { datePicker: selectedDate },
        success: function (response) {
            var orderList = JSON.parse(response);
            var tableBody = $('#orderList');
            tableBody.empty();
            if (orderList.length === 0) {
                tableBody.append('<tr><td colspan="7">해당 날짜에 주문 내역이 없습니다.</td></tr>');
            } else {
                orderList.forEach(function (order) {
                    var row = $('<tr>');
                    row.append($('<td>').text(order.order_no));
                    row.append($('<td>').text(order.user_no));
                    row.append($('<td>').text(order.user_id));
                    row.append($('<td>').text(order.username));
                    row.append($('<td>').text(order.food_code));
                    row.append($('<td>').text(order.order_date));
                    row.append($('<td>').append(
                        $('<form>').attr('method', 'post').attr('action', '<%= request.getContextPath() %>/userManagementDelete.jsp').append(
                            $('<input>').attr('type', 'hidden').attr('name', 'delete').attr('value', order.order_no),
                            $('<button>').attr('type', 'submit').addClass('btn cancelbtn btn-outline-danger').text('취소').css('float', 'right')
                        )
                    ));
                    tableBody.append(row);
                });
            }
        },
        error: function () {
            alert("주문 내역을 불러오는데 실패했습니다.");
        }
    });
}