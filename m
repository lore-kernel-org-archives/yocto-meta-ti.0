Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.1124.1601922046753032698
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 05 Oct 2020 11:20:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=y29JAbCi;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: vigneshr@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 095IKk8t017577
	for <meta-ti@lists.yoctoproject.org>; Mon, 5 Oct 2020 13:20:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1601922046;
	bh=zjLZrRmcfZckS4jaM6UyUzCkcQoOAVe1qsSqQGWGGoE=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=y29JAbCiV6c51HFvtfi/OmZhSgKcdvVJQNarvlpr+7fAU8XlhC89AsatUnuREjpvR
	 pgQax7FQ2IovFjjXyWYO7pgtia4+nPUUVj23nn3LHjQZwJqlcGyntSBvLZaAYaa/+Q
	 IrE6F/Hke+Ex7eIf8BfGcaLS/0B1IPYcfRo2IZ5M=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 095IKkth044714
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Mon, 5 Oct 2020 13:20:46 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 5 Oct
 2020 13:20:45 -0500
Received: from DFLE109.ent.ti.com ([fe80::e4e5:c81b:7525:c9b2]) by
 DFLE109.ent.ti.com ([fe80::e4e5:c81b:7525:c9b2%17]) with mapi id
 15.01.1979.003; Mon, 5 Oct 2020 13:20:45 -0500
From: "Vignesh Raghavendra" <vigneshr@ti.com>
To: "Rao, Praveen" <prao@ti.com>, "Murphy, Dan" <dmurphy@ti.com>,
        "meta-ti@lists.yoctoproject.org" <meta-ti@lists.yoctoproject.org>,
        "Dmytriyenko, Denys" <denys@ti.com>,
        "Goswami, Piyali" <piyali_g@ti.com>
CC: "Devshatwar, Nikhil" <nikhil.nd@ti.com>,
        "Jagannathan, Shyam"
	<shyam.jagannathan@ti.com>,
        "Weaver, Lucas" <l-weaver@ti.com>
Subject: Re: [meta-ti][master][patch][v2] ti-sci-fw: update imggen SRCREV to the latest
Thread-Topic: [meta-ti][master][patch][v2] ti-sci-fw: update imggen SRCREV to
 the latest
Thread-Index: AQHWmyZ4h8uGVd72I0K+qlOpBmA/JKmJmZ4AgAAIsoD//6+DSg==
Date: Mon, 5 Oct 2020 18:20:45 +0000
Message-ID: <f20e91bca4234eae87242f76e9276d6e@ti.com>
References: <20201005144611.31380-1-prao@ti.com>
 <00b5a4c7-4ad5-19f0-d502-54820e145e11@ti.com>,<48e5d6a8-a4c3-b586-4257-1e39aef67945@ti.com>
In-Reply-To: <48e5d6a8-a4c3-b586-4257-1e39aef67945@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.4.42.15]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_f20e91bca4234eae87242f76e9276d6eticom_"

--_000_f20e91bca4234eae87242f76e9276d6eticom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

+ Praneeth,




________________________________
From: Rao, Praveen
Sent: Monday, October 5, 2020 11:37 PM
To: Murphy, Dan; meta-ti@lists.yoctoproject.org; Dmytriyenko, Denys; Raghav=
endra, Vignesh; Goswami, Piyali
Cc: Devshatwar, Nikhil; Jagannathan, Shyam; Weaver, Lucas
Subject: Re: [meta-ti][master][patch][v2] ti-sci-fw: update imggen SRCREV t=
o the latest

OK Dan.

Vignesh, Nikhil,
Are the latest k3-img-gen patches supported for am65evm?

On 10/5/20 12:36 PM, Dan Murphy wrote:
> Praveen
>
> On 10/5/20 9:46 AM, prao@ti.com wrote:
>> From: Praveen Rao <prao@ti.com>
>>
>> Signed-off-by: Praveen Rao <prao@ti.com>
>> ---
>>   recipes-bsp/ti-sci-fw/ti-sci-fw.inc | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
>> b/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
>> index 183ac8a7..7d278815 100644
>> --- a/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
>> +++ b/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
>> @@ -7,7 +7,7 @@ PV =3D "2020.07-rc3"
>>   SRCREV =3D "f5438e998a7a8d23722fa4dcd1cdb62dec7a41d2"
>>   BRANCH ?=3D "ti-linux-firmware"
>> -SRCREV_imggen =3D "5b4d37b9bf41d58ff8c2f8dc98e5dac25e69ec56"
>> +SRCREV_imggen =3D "09256d5c21e6281d224646c1d4163d4dd0925238"
>>   SRCREV_FORMAT =3D "imggen"
>>   SRC_URI =3D " \
>
> This failed to build for am65evm
>
> http://lcpd.gt.design.ti.com/builds/arago-dunfell-next/prod/am65xx-evm/14=
5408/logs/am65xx-evm-error-logs/ti-sci-fw_2020.07-rc3-r1_do_compile.log
>
>
> Dan
>

--_000_f20e91bca4234eae87242f76e9276d6eticom_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"><!-- P {margin-top:0;margi=
n-bottom:0;} --></style>
</head>
<body dir=3D"ltr">
<div id=3D"divtagdefaultwrapper" style=3D"font-size:12pt;color:#000000;font=
-family:Calibri,Helvetica,sans-serif;" dir=3D"ltr">
<p>&#43; Praneeth,</p>
<p><span style=3D"font-size: 12pt;">&nbsp;</span><br>
</p>
<br>
<br>
<div style=3D"color: rgb(0, 0, 0);">
<div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" =
color=3D"#000000" style=3D"font-size:11pt"><b>From:</b> Rao, Praveen<br>
<b>Sent:</b> Monday, October 5, 2020 11:37 PM<br>
<b>To:</b> Murphy, Dan; meta-ti@lists.yoctoproject.org; Dmytriyenko, Denys;=
 Raghavendra, Vignesh; Goswami, Piyali<br>
<b>Cc:</b> Devshatwar, Nikhil; Jagannathan, Shyam; Weaver, Lucas<br>
<b>Subject:</b> Re: [meta-ti][master][patch][v2] ti-sci-fw: update imggen S=
RCREV to the latest</font>
<div>&nbsp;</div>
</div>
</div>
<font size=3D"2"><span style=3D"font-size:10pt;">
<div class=3D"PlainText">OK Dan.<br>
<br>
Vignesh, Nikhil,<br>
Are the latest k3-img-gen patches supported for am65evm?<br>
<br>
On 10/5/20 12:36 PM, Dan Murphy wrote:<br>
&gt; Praveen<br>
&gt; <br>
&gt; On 10/5/20 9:46 AM, prao@ti.com wrote:<br>
&gt;&gt; From: Praveen Rao &lt;prao@ti.com&gt;<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Praveen Rao &lt;prao@ti.com&gt;<br>
&gt;&gt; ---<br>
&gt;&gt; &nbsp; recipes-bsp/ti-sci-fw/ti-sci-fw.inc | 2 &#43;-<br>
&gt;&gt; &nbsp; 1 file changed, 1 insertion(&#43;), 1 deletion(-)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw.inc <br>
&gt;&gt; b/recipes-bsp/ti-sci-fw/ti-sci-fw.inc<br>
&gt;&gt; index 183ac8a7..7d278815 100644<br>
&gt;&gt; --- a/recipes-bsp/ti-sci-fw/ti-sci-fw.inc<br>
&gt;&gt; &#43;&#43;&#43; b/recipes-bsp/ti-sci-fw/ti-sci-fw.inc<br>
&gt;&gt; @@ -7,7 &#43;7,7 @@ PV =3D &quot;2020.07-rc3&quot;<br>
&gt;&gt; &nbsp; SRCREV =3D &quot;f5438e998a7a8d23722fa4dcd1cdb62dec7a41d2&q=
uot;<br>
&gt;&gt; &nbsp; BRANCH ?=3D &quot;ti-linux-firmware&quot;<br>
&gt;&gt; -SRCREV_imggen =3D &quot;5b4d37b9bf41d58ff8c2f8dc98e5dac25e69ec56&=
quot;<br>
&gt;&gt; &#43;SRCREV_imggen =3D &quot;09256d5c21e6281d224646c1d4163d4dd0925=
238&quot;<br>
&gt;&gt; &nbsp; SRCREV_FORMAT =3D &quot;imggen&quot;<br>
&gt;&gt; &nbsp; SRC_URI =3D &quot; \<br>
&gt; <br>
&gt; This failed to build for am65evm<br>
&gt; <br>
&gt; <a href=3D"http://lcpd.gt.design.ti.com/builds/arago-dunfell-next/prod=
/am65xx-evm/145408/logs/am65xx-evm-error-logs/ti-sci-fw_2020.07-rc3-r1_do_c=
ompile.log" id=3D"LPlnk166078" previewremoved=3D"true">
http://lcpd.gt.design.ti.com/builds/arago-dunfell-next/prod/am65xx-evm/1454=
08/logs/am65xx-evm-error-logs/ti-sci-fw_2020.07-rc3-r1_do_compile.log</a>
<br>
&gt; <br>
&gt; <br>
&gt; Dan<br>
&gt; <br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_f20e91bca4234eae87242f76e9276d6eticom_--
