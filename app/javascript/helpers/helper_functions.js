export const transformHighLowData = (data) => {

  const collection = [];
  data.forEach((item) => {
    collection.push(parseDataItem(item));
  });
  const headers = ['Date', 'One Month', 'Three Month', 'Six Month', 'Year', 'All Time'];
  collection.unshift(headers);
  return collection;
};

const parseDataItem = (item) => {
  let currentDate = new Date(item.created_at);
  let oneMonth = item.one_month_high - item.one_month_low;
  let threeMonth = item.three_month_high - item.three_month_low;
  let sixMonth = item.six_month_high - item.six_month_low;
  let fiftyTwo = item.fifty_two_week_high - item.fifty_two_week_low;
  let ath = item.all_time_high - item.all_time_low;
  return [currentDate, oneMonth, threeMonth, sixMonth, fiftyTwo, ath];
};
