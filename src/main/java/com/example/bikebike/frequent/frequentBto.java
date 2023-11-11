package com.example.bikebike.frequent;

public class frequentBto {
  private int siDo;
  private int gugun;
  private String spot_nm;
  private long lo_crd;
  private long la_crd;

  public frequentBto(int siDo, int gugun, String spot_nm, long lo_crd, long la_crd) {
    this.siDo = siDo;
    this.gugun = gugun;
    this.spot_nm = spot_nm;
    this.lo_crd = lo_crd;
    this.la_crd = la_crd;
  }

  public int getSiDo() {
    return siDo;
  }

  public void setSiDo(int siDo) {
    this.siDo = siDo;
  }

  public int getGugun() {
    return gugun;
  }

  public void setGugun(int gugun) {
    this.gugun = gugun;
  }

  public String getSpot_nm() {
    return spot_nm;
  }

  public void setSpot_nm(String spot_nm) {
    this.spot_nm = spot_nm;
  }

  public long getLo_crd() {
    return lo_crd;
  }

  public void setLo_crd(long lo_crd) {
    this.lo_crd = lo_crd;
  }

  public long getLa_crd() {
    return la_crd;
  }

  public void setLa_crd(long la_crd) {
    this.la_crd = la_crd;
  }
}
