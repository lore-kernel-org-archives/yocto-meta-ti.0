Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1F7D9E00DDC; Wed, 15 May 2019 13:42:39 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HTML_MESSAGE,RCVD_IN_DNSWL_MED autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.23.248 listed in list.dnswl.org]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2E5C5E00D5F
	for <meta-ti@yoctoproject.org>; Wed, 15 May 2019 13:42:38 -0700 (PDT)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4FKgORA017755;
	Wed, 15 May 2019 15:42:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1557952944;
	bh=6F82+to5WXQT2GESSRw3KY80qYeodCVoPtNNcsnVJ/w=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=u0VyxJ7xYvB7o6v9J2aynyC6KY5YjlNULLa2ZE88FVicSARkps0WfkEsR9nL1y2NX
	vPOSRQErOAjuP2T13/DLSBj2UZpcuprX8LMlQRKVSfLaec2+eW+gzXLBQvOb9fukBv
	5lRAkDW3u5rwcX5t/pmNlRmRNPbpfVchwgUxyLcw=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4FKgON6045654
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 15 May 2019 15:42:24 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Wed, 15 May 2019 15:42:24 -0500
Received: from DFLE112.ent.ti.com ([fe80::d4dd:a09e:396d:a895]) by
	DFLE112.ent.ti.com ([fe80::d4dd:a09e:396d:a895%18]) with mapi id
	15.01.1713.004; Wed, 15 May 2019 15:42:24 -0500
From: "Dmytriyenko, Denys" <denys@ti.com>
To: Philip Balister <philip@balister.org>
Thread-Topic: [meta-ti] clocl-native build failure
Thread-Index: AQHVC1x8tCRjSygWd0GsV9XEXJSYKKZspq5u
Date: Wed, 15 May 2019 20:42:24 +0000
Message-ID: <c26bd08d-c0c1-4f95-a828-f8148be21445@email.android.com>
References: <a52f75ef-0942-8b5d-1a34-d5b287081800@balister.org>
In-Reply-To: <a52f75ef-0942-8b5d-1a34-d5b287081800@balister.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: clocl-native build failure
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Wed, 15 May 2019 20:42:39 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_c26bd08dc0c14f95a828f8148be21445emailandroidcom_"

--_000_c26bd08dc0c14f95a828f8148be21445emailandroidcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Philip,

Let me get back to you in couple weeks, when I'm back from travel...

Denys



On May 15, 2019 15:26, Philip Balister <philip@balister.org> wrote:
I'm trying to get opencl runniin on a beagle X15 so i can try using it
with gnuradio.

I;m not using meta-arago or mete-linaro. I've got as far as a failure in
clocl-native. My config is:

https://github.com/balister/sdr-build/tree/ti-master

Any tips would be great, I'd love to ahve this actually working.

Philip


sic  `llvm-config --libs`
-L/home/balister/opensdr/ti-thud/build/tmp-glibc/work/x86_64-linux/clocl-na=
tive/1.1.18.00-r0.0/recipe-sysroot-native/usr/lib/ti-llvm3.6
 -lpthread -lrt -ldl -lm
-L/home/balister/opensdr/ti-thud/build/tmp-glibc/work/x86_64-linux/clocl-na=
tive/1.1.18.00-r0.0/recipe-sysroot-native/usr/lib

-L/home/balister/opensdr/ti-thud/build/tmp-glibc/work/x86_64-linux/clocl-na=
tive/1.1.18.00-r0.0/recipe-sysroot-native/lib
                        -Wl,--enable-new-dtags
-Wl,-rpath-link,/home/balister/opensdr/ti-thud/build/tmp-glibc/work/x86_64-=
linux/clocl-native/1.1.18.00-r0.0/recipe-sysroot-native/usr/lib

-Wl,-rpath-link,/home/balister/opensdr/ti-thud/build/tmp-glibc/work/x86_64-=
linux/clocl-native/1.1.18.00-r0.0/recipe-sysroot-native/lib

-Wl,-rpath,/home/balister/opensdr/ti-thud/build/tmp-glibc/work/x86_64-linux=
/clocl-native/1.1.18.00-r0.0/recipe-sysroot-native/usr/lib

-Wl,-rpath,/home/balister/opensdr/ti-thud/build/tmp-glibc/work/x86_64-linux=
/clocl-native/1.1.18.00-r0.0/recipe-sysroot-native/lib
                        -Wl,-O1 -o x86/clocl
/home/balister/opensdr/ti-thud/build/tmp-glibc/hosttools/ld: cannot find
-lpthread
/home/balister/opensdr/ti-thud/build/tmp-glibc/hosttools/ld: cannot find
-lrt
/home/balister/opensdr/ti-thud/build/tmp-glibc/hosttools/ld: cannot find
-ldl
/home/balister/opensdr/ti-thud/build/tmp-glibc/hosttools/ld: cannot find
-lstdc++
/home/balister/opensdr/ti-thud/build/tmp-glibc/hosttools/ld: cannot find -l=
m
/home/balister/opensdr/ti-thud/build/tmp-glibc/hosttools/ld: cannot find -l=
c
collect2: error: ld returned 1 exit status
make: *** [Makefile:86: x86/clocl] Error 1
make: Leaving directory
'/home/balister/opensdr/ti-thud/build/tmp-glibc/work/x86_64-linux/clocl-nat=
ive/1.1.18.00-r0.0/git/host/clocl'
ERROR: oe_runmake failed
WARNING: /home/balister/open
--
_______________________________________________
meta-ti mailing list
meta-ti@yoctoproject.org
https://lists.yoctoproject.org/listinfo/meta-ti

--_000_c26bd08dc0c14f95a828f8148be21445emailandroidcom_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<!-- converted from text --><style><!-- .EmailQuote { margin-left: 1pt; pad=
ding-left: 4pt; border-left: #800000 2px solid; } --></style>
</head>
<body>
<div>
<div dir=3D"auto">Hi Philip,
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">Let me get back to you in couple weeks, when I'm back fro=
m travel...</div>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">Denys</div>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto"><br>
</div>
</div>
<div class=3D"x_gmail_extra"><br>
<div class=3D"x_gmail_quote">On May 15, 2019 15:26, Philip Balister &lt;phi=
lip@balister.org&gt; wrote:<br type=3D"attribution">
</div>
</div>
</div>
<font size=3D"2"><span style=3D"font-size:10pt;">
<div class=3D"PlainText">I'm trying to get opencl runniin on a beagle X15 s=
o i can try using it<br>
with gnuradio.<br>
<br>
I;m not using meta-arago or mete-linaro. I've got as far as a failure in<br=
>
clocl-native. My config is:<br>
<br>
<a href=3D"https://github.com/balister/sdr-build/tree/ti-master">https://gi=
thub.com/balister/sdr-build/tree/ti-master</a><br>
<br>
Any tips would be great, I'd love to ahve this actually working.<br>
<br>
Philip<br>
<br>
<br>
sic&nbsp; `llvm-config --libs`<br>
-L/home/balister/opensdr/ti-thud/build/tmp-glibc/work/x86_64-linux/clocl-na=
tive/1.1.18.00-r0.0/recipe-sysroot-native/usr/lib/ti-llvm3.6<br>
&nbsp;-lpthread -lrt -ldl -lm<br>
-L/home/balister/opensdr/ti-thud/build/tmp-glibc/work/x86_64-linux/clocl-na=
tive/1.1.18.00-r0.0/recipe-sysroot-native/usr/lib<br>
<br>
-L/home/balister/opensdr/ti-thud/build/tmp-glibc/work/x86_64-linux/clocl-na=
tive/1.1.18.00-r0.0/recipe-sysroot-native/lib<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -Wl,--enabl=
e-new-dtags<br>
-Wl,-rpath-link,/home/balister/opensdr/ti-thud/build/tmp-glibc/work/x86_64-=
linux/clocl-native/1.1.18.00-r0.0/recipe-sysroot-native/usr/lib<br>
<br>
-Wl,-rpath-link,/home/balister/opensdr/ti-thud/build/tmp-glibc/work/x86_64-=
linux/clocl-native/1.1.18.00-r0.0/recipe-sysroot-native/lib<br>
<br>
-Wl,-rpath,/home/balister/opensdr/ti-thud/build/tmp-glibc/work/x86_64-linux=
/clocl-native/1.1.18.00-r0.0/recipe-sysroot-native/usr/lib<br>
<br>
-Wl,-rpath,/home/balister/opensdr/ti-thud/build/tmp-glibc/work/x86_64-linux=
/clocl-native/1.1.18.00-r0.0/recipe-sysroot-native/lib<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -Wl,-O1 -o =
x86/clocl<br>
/home/balister/opensdr/ti-thud/build/tmp-glibc/hosttools/ld: cannot find<br=
>
-lpthread<br>
/home/balister/opensdr/ti-thud/build/tmp-glibc/hosttools/ld: cannot find<br=
>
-lrt<br>
/home/balister/opensdr/ti-thud/build/tmp-glibc/hosttools/ld: cannot find<br=
>
-ldl<br>
/home/balister/opensdr/ti-thud/build/tmp-glibc/hosttools/ld: cannot find<br=
>
-lstdc&#43;&#43;<br>
/home/balister/opensdr/ti-thud/build/tmp-glibc/hosttools/ld: cannot find -l=
m<br>
/home/balister/opensdr/ti-thud/build/tmp-glibc/hosttools/ld: cannot find -l=
c<br>
collect2: error: ld returned 1 exit status<br>
make: *** [Makefile:86: x86/clocl] Error 1<br>
make: Leaving directory<br>
'/home/balister/opensdr/ti-thud/build/tmp-glibc/work/x86_64-linux/clocl-nat=
ive/1.1.18.00-r0.0/git/host/clocl'<br>
ERROR: oe_runmake failed<br>
WARNING: /home/balister/open<br>
-- <br>
_______________________________________________<br>
meta-ti mailing list<br>
meta-ti@yoctoproject.org<br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-ti">https://lists.y=
octoproject.org/listinfo/meta-ti</a><br>
</div>
</span></font>
</body>
</html>

--_000_c26bd08dc0c14f95a828f8148be21445emailandroidcom_--
