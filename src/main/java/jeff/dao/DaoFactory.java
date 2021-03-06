package jeff.dao;

public interface DaoFactory {
    ApplicationDao getApplicationDao();
    ArrangementDao getArrangementDao();
    HolidayDao getHolidayDao();
    LoginDao getLoginDao();
    StaffDao getStaffDao();
    WorkHistoryDao getWorkHistoryDao();
    SettingsDao getSettingsDao();
}
