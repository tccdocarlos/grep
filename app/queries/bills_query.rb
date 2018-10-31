class BillsQuery

  def initialize(dweller, paid_date = nil)
    @dweller = dweller
    @paid_date = paid_date
  end

  def all
    BillApportionment.where("dweller_id = ?", @dweller)
  end
end