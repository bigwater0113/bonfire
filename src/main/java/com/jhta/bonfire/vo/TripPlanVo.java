package com.jhta.bonfire.vo;

public class TripPlanVo {
    private int idx;
    private String id;
    private int placeid;
    private int triporder;

    public TripPlanVo() {
    }

    public TripPlanVo(int idx, String id, int placeid, int triporder) {
        this.idx = idx;
        this.id = id;
        this.placeid = placeid;
        this.triporder = triporder;
    }

    public int getIdx() {
        return this.idx;
    }

    public void setIdx(int idx) {
        this.idx = idx;
    }

    public String getId() {
        return this.id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public int getPlaceid() {
        return this.placeid;
    }

    public void setPlaceid(int placeid) {
        this.placeid = placeid;
    }

    public int getTriporder() {
        return this.triporder;
    }

    public void setTriporder(int triporder) {
        this.triporder = triporder;
    }

}
