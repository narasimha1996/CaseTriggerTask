public class ComparatorInterface Implements Comparator<EmployeeData> {
    Public Integer Compare(EmployeeData e1,EmployeeData e2){
        if(e1?.getName()==null && e2?.getName()==null){
            return 0;
        }else if(e1?.getName()==null){
            return -1;
        }else if(e2?.getName()==null){
        return 1;
    }
        return e1.getName().CompareTo(e2.getName());
	}
}