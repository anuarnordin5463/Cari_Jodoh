//
//  Constant.swift
//  JodohApp
//
//  Created by Nazri Hussein on 5/12/16.
//  Copyright © 2016 intern. All rights reserved.
//

import UIKit
import SCLAlertView

let defaults = NSUserDefaults.standardUserDefaults()

var genderArray : [Dictionary<String, AnyObject>] = [["gender_code":"Perempuan","gender_name":"Perempuan"],["gender_code":"Lelaki","gender_name":"Lelaki"]]
var smokerArray : [Dictionary<String, AnyObject>] = [["smoker_code":"Ya","smoker_name":"Ya"],["smoker_code":"Tidak","smoker_name":"Tidak"]]
var countryArray : [Dictionary<String, AnyObject>] = [["country_code":"Malaysia","country_name":"Malaysia"],["country_code":"Lain-Lain","country_name":"Lain-Lain"]]
var maritalArray : [Dictionary<String, AnyObject>] =
    [["marital_code":"Bujang","marital_name":"Bujang"],
     ["marital_code":"Sudah Berkahwin","marital_name":"Sudah Berkahwin"],
     ["marital_code":"Janda / Duda","marital_name":"Janda / Duda"]]
var childrenArray : [Dictionary<String, AnyObject>] =
    [["children_code":"Tiada","children_name":"Tiada"],
     ["children_code":"1","children_name":"1"],
     ["children_code":"2","children_name":"2"],
     ["children_code":"3","children_name":"3"],
     ["children_code":"4","children_name":"4"],
     ["children_code":"5 dan keatas","children_name":"5 dan keatas"]]

var relationshipArray : [Dictionary<String, AnyObject>] =
    [["relationship_code":"Serius Mencari","relationship_name":"Serius Mencari"],
     ["relationship_code":"Tidak Serius Mencari","relationship_name":"Tidak Serius Mencari"],
     ["relationship_code":"Sedang Mengenali Seseorang","relationship_name":"Sedang Mengenali Seseorang"],
     ["relationship_code":"Tidak Pasti","relationship_name":"Tidak Pasti"]]
var polygamyArray : [Dictionary<String, AnyObject>] =
    [["polygamy_code":"Boleh dibincangkan","polygamy_name":"Boleh dibincangkan"],
     ["polygamy_code":"Boleh difikirkan","polygamy_name":"Boleh difikirkan"],
     ["polygamy_code":"Tidak bersetuju","polygamy_name":"Tidak bersetuju"],
     ["polygamy_code":"Bersetuju","polygamy_name":"Bersetuju"]]
var financialArray : [Dictionary<String, AnyObject>] =
    [["financial_code":"Tidak bekerja","financial_name":"Tidak bekerja"],
     ["financial_code":"Berpendapatan rendah","financial_name":"Berpendapatan rendah"],
     ["financial_code":"Berpendapatan sederhana","financial_name":"Berpendapatan sederhana"],
     ["financial_code":"Berpendapatan tinggi","financial_name":"Berpendapatan tinggi"],
     ["financial_code":"Perlu maklumat lanjut","financial_name":"Perlu maklumat lanjut"]]

var stateArray : [Dictionary<String, AnyObject>] =
    [["state_code":"Johor","state_name":"Johor"],
     ["state_code":"Kedah","state_name":"Kedah"],
     ["state_code":"Kelantan","state_name":"Kelantan"],
     ["state_code":"Melaka","state_name":"Melaka"],
     ["state_code":"Negeri Sembilan","state_name":"Negeri Sembilan"],
     ["state_code":"Pahang","state_name":"Pahang"],
     ["state_code":"Perak","state_name":"Perak"],
     ["state_code":"Perlis","state_name":"Perlis"],
     ["state_code":"Pulau Pinang","state_name":"Pulau Pinang"],
     ["state_code":"Sabah","state_name":"Sabah"],
     ["state_code":"Sarawak","state_name":"Sarawak"],
     ["state_code":"Selangor","state_name":"Selangor"],
     ["state_code":"Terengganu","state_name":"Terengganu"],
     ["state_code":"Wilayah Persekutuan","state_name":"Wilayah Persekutuan"]]
var educationArray : [Dictionary<String, AnyObject>] =
    [["education_code":"Tiada","education_name":"Tiada"],
     ["education_code":"PMR (Penilaian Menengah Rendah)","education_name":"PMR (Penilaian Menengah Rendah)"],
     ["education_code":"SRP (Sijil Rendah Pelajaran)","education_name":"SRP (Sijil Rendah Pelajaran)"],
     ["education_code":"SPM (Sijil Pelajaran Malaysia)","education_name":"SPM (Sijil Pelajaran Malaysia)"],
     ["education_code":"MCE (Malaysian Certificate of Education)","education_name":"MCE (Malaysian Certificate of Education)"],
     ["education_code":"SPMV (Sijil Pelajaran Malaysia Vokasional)","education_name":"SPMV (Sijil Pelajaran Malaysia Vokasional)"],
     ["education_code":"STPM (Sijil Tinggi Persekolahan Malaysia)","education_name":"STPM (Sijil Tinggi Persekolahan Malaysia)"],
     ["education_code":"STAM (Sijil Tinggi Agama Malaysia)","education_name":"STAM (Sijil Tinggi Agama Malaysia)"],
     ["education_code":"SKM (Sijil Kemahiran Malaysia) / Sijil Modula Kebangsaan","education_name":"SKM (Sijil Kemahiran Malaysia) / Sijil Modula Kebangsaan"],
     ["education_code":"Sijil Kompeten","education_name":"Sijil Kompeten"],
     ["education_code":"Matrikulasi /Asasi / Pra-Universiti / Kolej","education_name":"Matrikulasi /Asasi / Pra-Universiti / Kolej"],
     ["education_code":"Diploma","education_name":"Diploma"],
     ["education_code":"Degree (Ijazah Sarjana Muda)","education_name":"Degree (Ijazah Sarjana Muda)"],
     ["education_code":"Master (Ijazah Sarjana)","education_name":"Master (Ijazah Sarjana)"],
     ["education_code":"PHD (Ijazah Doktor Falsafah)","education_name":"PHD (Ijazah Doktor Falsafah)"]]

var occupationArray : [Dictionary<String, AnyObject>] =
    [["occupation_code":"Tiada","occupation_name":"Tiada"],
     ["occupation_code":"Admin / Pentadbiran","occupation_name":"Admin / Pentadbiran"],
     ["occupation_code":"Akauntan / Pengurus Kewangan","occupation_name":"Akauntan / Pengurus Kewangan"],
     ["occupation_code":"Alam Sekitar / Sosiologi","occupation_name":"Alam Sekitar / Sosiologi"],
     ["occupation_code":"Arkitek / Seni Bina","occupation_name":"Arkitek / Seni Bina"],
     ["occupation_code":"Badan Beruniform","occupation_name":"Badan Beruniform"],
     ["occupation_code":"Fesyen / Kecantikkan / Estetik","occupation_name":"Fesyen / Kecantikkan / Estetik"],
     ["occupation_code":"Fotografi/ Perfileman / Produksi","occupation_name":"Fotografi/ Perfileman / Produksi"],
     ["occupation_code":"Hartanah","occupation_name":"Hartanah"],
     ["occupation_code":"Industri Minyak dan Gas / Geologi","occupation_name":"Industri Minyak dan Gas / Geologi"],
     ["occupation_code":"Insurans / Takaful","occupation_name":"Insurans / Takaful"],
     ["occupation_code":"Keagamaan / Syariah / Islamaik","occupation_name":"Keagamaan / Syariah / Islamaik"],
     ["occupation_code":"Kejuruteraan","occupation_name":"Kejuruteraan"],
     ["occupation_code":"Kemahiran / Freelancer","occupation_name":"Kemahiran / Freelancer"],
     ["occupation_code":"Kesihatan / Perubatan / Farmasi","occupation_name":"Kesihatan / Perubatan / Farmasi"],
     
     ["occupation_code":"Keusahawanan","occupation_name":"Keusahawanan"],
     ["occupation_code":"Komputer / Teknologi Maklumat","occupation_name":"Komputer / Teknologi Maklumat"],
     ["occupation_code":"Komunikasi / Kewartawanan / Pengacaraan","occupation_name":"Komunikasi / Kewartawanan / Pengacaraan"],
     ["occupation_code":"Konstruksi / Pembinaan","occupation_name":"Konstruksi / Pembinaan"],
     ["occupation_code":"Lain-lain Bidang","occupation_name":"Lain-lain Bidang"],
     ["occupation_code":"Lakonan / Theater","occupation_name":"Lakonan / Theater"],
     ["occupation_code":"Majlis / Aturcara","occupation_name":"Majlis / Aturcara"],
     ["occupation_code":"Makanan & Minuman / Kafe & Restoran","occupation_name":"Makanan & Minuman / Kafe & Restoran"],
     ["occupation_code":"Media / Radio / Persiaran","occupation_name":"Media / Radio / Persiaran"],
     ["occupation_code":"Nyanyian / Komposer / Penulis Lirik","occupation_name":"Nyanyian / Komposer / Penulis Lirik"],
     ["occupation_code":"Pelajar","occupation_name":"Pelajar"],
     ["occupation_code":"Pelancongan / Perhotelan","occupation_name":"Pelancongan / Perhotelan"],
     ["occupation_code":"Pemasaran / Jualan / Periklanan","occupation_name":"Pemasaran / Jualan / Periklanan"],
     ["occupation_code":"Pendidikan / Latihan","occupation_name":"Pendidikan / Latihan"],
     ["occupation_code":"Penerbangan","occupation_name":"Penerbangan"],
     
     ["occupation_code":"Pengangkutan / Logistik","occupation_name":"Pengangkutan / Logistik"],
     ["occupation_code":"Penjawat Awam","occupation_name":"Penjawat Awam"],
     ["occupation_code":"Perhubungan Korporat","occupation_name":"Perhubungan Korporat"],
     ["occupation_code":"Perkapalan","occupation_name":"Perkapalan"],
     ["occupation_code":"Perkilangan / Proses Industri","occupation_name":"Perkilangan / Proses Industri"],
     ["occupation_code":"Perniagaan","occupation_name":"Perniagaan"],
     ["occupation_code":"Pertanian / Perikanan","occupation_name":"Pertanian / Perikanan"],
     ["occupation_code":"Politik","occupation_name":"Politik"],
     ["occupation_code":"Reka Grafik","occupation_name":"Reka Grafik"],
     ["occupation_code":"Sains / Penyelidikan","occupation_name":"Sains / Penyelidikan"],
     ["occupation_code":"Sukan / Rekreasi","occupation_name":"Sukan / Rekreasi"],
     ["occupation_code":"Sukarelawan / NGO","occupation_name":"Sukarelawan / NGO"],
     ["occupation_code":"Undang-undang","occupation_name":"Undang-undang"]]

let url = NSURL(string: "http://carijodoh.me-tech.com.my/user_image/")

internal struct Tags {
    static let ValidationUsername = "Emel"
    static let ValidationPassword = "Kata Laluan"
    static let ValidationDOB = "DOB"
    static let ValidationNewPassword = "New Password"
    static let ValidationConfirmPassword = "Sah Kata Laluan"
    static var ValidationName = "Nama"
    static var ValidationFirstName = "First Name"
    static var ValidationLastName = "Last Name"
    static var ValidationDate = "Date"
    static var ValidationCountry = "Country"
    static let ValidationTown = "Bandar"
    static let ValidationState = "State"
    static let ValidationMobile = "Telefon Bimbit"
    static let ValidationEmail = "Email"
    static var ValidationHeight = "Tinggi"
    static var ValidationWeight = "Berat"
    static var ValidationSmokerVapes = "Smoker/Vapes"
    static var ValidationHighEducation = "High Education"
    static var ValidationOccupation = "Occupation"
    static var ValidationMaritalStatus = "Marital status"
    static var ValidationHaveAChildren = "HaveAChildren"
    static var ValidationRelationshipStatus = "Relationship Status"
    static var ValidationPolygamy = "Polygamy"
    static var ValidationFinancialLevel = "Financial Level"
    
    static var ValidationKataLaluanLama = "Kata Laluan Lama"
    static var ValidationKataLaluanBaru = "Kata Laluan Baru"
    static var ValidationSahKataLaluan = "Sah Kata Laluan"
    static var ValidationJantina = "Validation Jantina"
    
}

internal struct Tags2 {
    static let ValidationEmel = "Emel"
    static let ValidationKataLaluan = "Kata Laluan"
    static let ValidationSahKataLaluan = "SahKataLaluan"
}

func showErrorMessage(message : String){
    
    let errorView = SCLAlertView()
    errorView.showError("Error!", subTitle:message, colorStyle: 0x0679AD, closeButtonTitle : "OK")
}

func showErrorMessageKemaskini(message : String){
    
    let errorView = SCLAlertView()
    errorView.showError("Error!", subTitle:message, colorStyle: 0x0679AD, closeButtonTitle : "OK")
}

func showInfoRegister(message:String){
    
    let infoView = SCLAlertView()
    //infoView.showInfo("Info", subTitle: message+"Sila Log Masuk", closeButtonTitle: "OK", colorStyle: 0x0679AD)
    infoView.showInfo("Info", subTitle: "Sila Log Masuk", closeButtonTitle: "OK", colorStyle: 0x0679AD)
}

func showInfoLogin(message:String){
    
    let infoView = SCLAlertView()
    infoView.showInfo("Info", subTitle: message, closeButtonTitle: "OK", colorStyle: 0x0679AD)
}

func showInfoSuccessUpdate(message:String){
    
    let infoView = SCLAlertView()
    //infoView.showInfo("Info", subTitle: message, closeButtonTitle: "OK", colorStyle: 0x0679AD)
    infoView.showInfo("Info", subTitle: "Kemaskini Berjaya", closeButtonTitle: "OK", colorStyle: 0x0679AD)
}

func canOpenURL(string: String?) -> Bool {
    guard let urlString = string else {return false}
    guard let url = NSURL(string: urlString) else {return false}
    if !UIApplication.sharedApplication().canOpenURL(url) {return false}
    
    //
    let regEx = "((https|http)://)((\\w|-)+)(([.]|[/])((\\w|-)+))+"
    let predicate = NSPredicate(format:"SELF MATCHES %@", argumentArray:[regEx])
    return predicate.evaluateWithObject(string)
}

var viewsController = UIViewController()

func showLoading(){
    
    let appDelegate = UIApplication.sharedApplication().keyWindow
    let root = appDelegate?.rootViewController
    viewsController = root!
    
    let storyboard = UIStoryboard(name: "LoadingScreen", bundle: nil)
    let loadingVC = storyboard.instantiateViewControllerWithIdentifier("LoadingScreenVC") as! LoadingScreenViewController
    loadingVC.view.backgroundColor = UIColor.clearColor()
    
    viewsController.presentViewController(loadingVC, animated: true, completion: nil)
    
}

func hideLoading(){
    
    viewsController.presentedViewController?.dismissViewControllerAnimated(true, completion: nil)
    
}



