Return-Path: <shoghi@willowglen.asia>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 03D84E00D07; Thu, 14 Apr 2016 00:34:22 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, HTML_MESSAGE, RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.161.179 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yw0-f179.google.com (mail-yw0-f179.google.com
	[209.85.161.179])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6AD51E00833
	for <meta-ti@yoctoproject.org>; Thu, 14 Apr 2016 00:34:19 -0700 (PDT)
Received: by mail-yw0-f179.google.com with SMTP id d68so95590264ywe.1
	for <meta-ti@yoctoproject.org>; Thu, 14 Apr 2016 00:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=willowglen-asia.20150623.gappssmtp.com; s=20150623;
	h=mime-version:date:message-id:subject:from:to;
	bh=Epyq63KlY0GjlCYEL8v1tR7Qjvc1jM4ZizIy3Jyo5KQ=;
	b=f9Z6+nlwE/92L4Kd4dChOFtu7k82SucKWEXYx0MUTTQZoAe4AQgnNO0uF6uxKFNB2K
	Y/Q/+RObnHbxyjQVYZf21CISfYRbbNk92hyQQmr1ZXOPRhSAOwY5ETKf9QybUlLd4cF9
	1fWtE5ug4J7VQbjyWCFw//8lgRJrNqvuqxESFFxB5OwzxIWiKgaAPV5gmAmDOovP64JD
	6hkUrG0J88OZ61Z6UVTeAn2D8glaq4L6+d2R4bnJIksaFXCueSR2H3rGOk4QfXSC6jHP
	mTYRLiTWqqKkI1P154rrICMsctH2fG0nyrTlqenD+aLooJvgRcqPyUKDIcgVr7iuiXXj
	P57A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
	bh=Epyq63KlY0GjlCYEL8v1tR7Qjvc1jM4ZizIy3Jyo5KQ=;
	b=Kqjhv36o/4uhMfrCOyr2OlSEa7omZcW5JYjCE0HDpoClfg20mMDq2eyD/Hvk5WraBX
	KyttkkKt+zXse3pL5KsjgKG5sAiMKlwKxoDL56Pp37x7mZil6QvHYXFwmrOa4QZ44CgQ
	+Vxc6sEs3AZIaa52zP4z4AjXh67gNwR5EN3krhca4JqSQP5evmIBAuzQI2P3mv7iDtYq
	dKg4NbfOJZ9zynVhkc1Ugewr6TnAE0Rlp1o/Fqgxo9RQZFZIXL0lnZmEB5FgVF27ojIN
	7z3t3bhmEqRPsn5c6nZwuT3aggWIW2ONsrLlLfrmUDdBJzc3rZNqrw1932D4FM2V+NIk
	QlDw==
X-Gm-Message-State: AOPr4FV6m7OiLGSYl5i07vjAsO9CJzUBkVo8B3GQDYPBG+UTGeCceqopJdlUbFynnKvHyEw1aEVKiOIB1QjpOg==
MIME-Version: 1.0
X-Received: by 10.37.217.207 with SMTP id q198mr7711762ybg.52.1460619259163;
	Thu, 14 Apr 2016 00:34:19 -0700 (PDT)
Received: by 10.129.93.215 with HTTP; Thu, 14 Apr 2016 00:34:19 -0700 (PDT)
Message-ID: <CAFxUzqhs8+3i6+EM5FWu4d9V-sopT8pTF=BZV_Bj8aZJi3vHOA@mail.gmail.com>
From: "Shoghi Effendi Narayanasamy (WMSC-HW)" <shoghi@willowglen.asia>
To: meta-ti@yoctoproject.org
X-Mailman-Approved-At: Fri, 23 Dec 2016 15:51:53 -0800
Subject: meta-ti PRU packages + eudev missing recipe issues
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
Date: Thu, 14 Apr 2016 07:34:22 -0000
X-Original-Date: Thu, 14 Apr 2016 15:34:19 +0800
X-List-Received-Date: Thu, 14 Apr 2016 07:34:22 -0000
Content-Type: multipart/alternative; boundary=001a114fd37618681405306cec0e

--001a114fd37618681405306cec0e
Content-Type: text/plain; charset=UTF-8

hi all

im using am3359 running on a moduleboard (phytec-phycore), in which i need
to compile and use the PRUSS package. im using yocto and followed a manual
to install the the whole meta-ti package as an layer into my yocto source,
but during executing the bitbake to produce the image i get the below
error:-

Error: no recipes available for:-

/opt/PHYTEC_BSPs/yocto_ti/sources/poky/../meta-ti/recipes-core/udev/eudev/eudev_%.bbappend

because of this error i also cant compile the PRU package.

i cloned the meta-ti into my source folder from here:-

http://layers.openembedded.org/layerindex/branch/master/layer/meta-ti/

the manual i followed to add meta ti layer:-

http://develop.phytec.com/display/PKB/PhyCORE-AM335x+RDK+Linux+Quickstart+PD15.2.x#PhyCORE-AM335xRDKLinuxQuickstartPD15.2.x-AddingPackagestothebuild

anyway searching in an existing mail archive as below  :-

 https://lists.yoctoproject.org/pipermail/meta-ti/2016-April/008399.html

a user reply the solution as :-

{Two things - it was already fixed almost 2 weeks ago, so you seem to
be using outdated snapshot. Second, use distro that doesn't error out
on unused
bbappends...

And then again, you are trying to mix/match different branches of layers, so
you might have some other weird issues down the road.}

my problem is similiar as my BSP is based on dizzy and i cloned the
meta-ti from master. anyway by reading the existing mail solution i
still cant understand what to do next?? "*how to make the distro to
error out on unused bbapends*??"  i just cloned the meta-ti from the
above address few days ago so im sure it the latest snapshot. My main
goal finally to enable and use the PRUSS package. thanks all in
advanced. hope some light in shed on this matter.


wtrgds

shoghi

--001a114fd37618681405306cec0e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><p style=3D"color:rgb(0,0,0);font-family:Arial,Helvetica,s=
ans-serif;font-size:12px;line-height:18px">hi all</p><p style=3D"color:rgb(=
0,0,0);font-family:Arial,Helvetica,sans-serif;font-size:12px;line-height:18=
px">im using am3359 running on a moduleboard (phytec-phycore), in which i n=
eed to compile and use the PRUSS package. im using yocto and followed a man=
ual to install the the whole meta-ti package as an layer into my yocto sour=
ce, but during executing the bitbake to produce the image i get the below e=
rror:-</p><p style=3D"color:rgb(0,0,0);font-family:Arial,Helvetica,sans-ser=
if;font-size:12px;line-height:18px"><span style=3D"color:rgb(255,0,0)">Erro=
r: no recipes available for:-</span></p><p style=3D"color:rgb(0,0,0);font-f=
amily:Arial,Helvetica,sans-serif;font-size:12px;line-height:18px"><span sty=
le=3D"color:rgb(255,0,0)">/opt/PHYTEC_BSPs/yocto_ti/sources/poky/../meta-ti=
/recipes-core/udev/eudev/eudev_%.bbappend</span></p><p style=3D"color:rgb(0=
,0,0);font-family:Arial,Helvetica,sans-serif;font-size:12px;line-height:18p=
x">because of this error i also cant compile the PRU package.</p><p style=
=3D"color:rgb(0,0,0);font-family:Arial,Helvetica,sans-serif;font-size:12px;=
line-height:18px">i cloned the meta-ti into my source folder from here:-=C2=
=A0</p><p style=3D"color:rgb(0,0,0);font-family:Arial,Helvetica,sans-serif;=
font-size:12px;line-height:18px"><a href=3D"http://layers.openembedded.org/=
layerindex/branch/master/layer/meta-ti/" title=3D"meta-ti yocto layer" targ=
et=3D"_blank">http://layers.openembedded.org/layerindex/branch/master/layer=
/meta-ti/</a></p><p style=3D"color:rgb(0,0,0);font-family:Arial,Helvetica,s=
ans-serif;font-size:12px;line-height:18px">the manual i followed to add met=
a ti layer:-<br></p><p style=3D"font-size:12.8px"><font color=3D"#000000" f=
ace=3D"Arial, Helvetica, sans-serif"><span style=3D"font-size:12px;line-hei=
ght:18px"><a href=3D"http://develop.phytec.com/display/PKB/PhyCORE-AM335x+R=
DK+Linux+Quickstart+PD15.2.x#PhyCORE-AM335xRDKLinuxQuickstartPD15.2.x-Addin=
gPackagestothebuild" target=3D"_blank">http://develop.phytec.com/display/PK=
B/PhyCORE-AM335x+RDK+Linux+Quickstart+PD15.2.x#PhyCORE-AM335xRDKLinuxQuicks=
tartPD15.2.x-AddingPackagestothebuild</a></span></font><br></p><p style=3D"=
color:rgb(0,0,0);font-family:Arial,Helvetica,sans-serif;font-size:12px;line=
-height:18px"></p><p style=3D""><font color=3D"#000000" face=3D"Arial, Helv=
etica, sans-serif"><span style=3D"line-height:18px">anyway searching in an =
existing mail archive as below =C2=A0:-</span></font></p><p style=3D""><fon=
t color=3D"#000000" face=3D"Arial, Helvetica, sans-serif"><span style=3D"li=
ne-height:18px">=C2=A0<a href=3D"https://lists.yoctoproject.org/pipermail/m=
eta-ti/2016-April/008399.html">https://lists.yoctoproject.org/pipermail/met=
a-ti/2016-April/008399.html</a></span></font></p><p style=3D"color:rgb(0,0,=
0);line-height:18px"><span style=3D"line-height:normal"><font face=3D"arial=
, helvetica, sans-serif">a user reply the solution as :-</font></span></p><=
pre style=3D"white-space:pre-wrap;color:rgb(0,0,0)">{Two things - it was al=
ready fixed almost 2 weeks ago, so you seem to be using outdated snapshot. =
Second, use distro that doesn&#39;t error out on unused=20
bbappends...

And then again, you are trying to mix/match different branches of layers, s=
o=20
you might have some other weird issues down the road.}</pre><pre><font face=
=3D"arial, helvetica, sans-serif"><font color=3D"#000000"><span style=3D"wh=
ite-space:pre-wrap">my problem is similiar as my BSP is based on dizzy and =
i cloned the meta-ti from master. anyway by reading the existing mail solut=
ion i still cant understand what to do next?? &quot;<i>how to make the dist=
ro to error out on unused bbapends</i>??&quot;  i just cloned the meta-ti f=
rom the above address few days ago so im sure it the latest snapshot. My ma=
in goal finally to enable and use the PRUSS package. thanks all in advanced=
. hope some light in shed on this matter.</span></font></font></pre><pre><f=
ont face=3D"arial, helvetica, sans-serif"><font color=3D"#000000"><span sty=
le=3D"white-space:pre-wrap"><br></span></font></font></pre><pre><font face=
=3D"arial, helvetica, sans-serif"><font color=3D"#000000"><span style=3D"wh=
ite-space:pre-wrap">wtrgds</span></font></font></pre><pre><font face=3D"ari=
al, helvetica, sans-serif"><font color=3D"#000000"><span style=3D"white-spa=
ce:pre-wrap">shoghi</span></font></font></pre><p style=3D"color:rgb(0,0,0);=
font-family:Arial,Helvetica,sans-serif;font-size:12px;line-height:18px"><br=
></p><p style=3D"color:rgb(0,0,0);font-family:Arial,Helvetica,sans-serif;fo=
nt-size:12px;line-height:18px"><br></p></div>

--001a114fd37618681405306cec0e--
