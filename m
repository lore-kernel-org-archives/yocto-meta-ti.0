Return-Path: <supernova_7072@yahoo.com>
Received: from nm6-vm0.bullet.mail.ne1.yahoo.com
	(nm6-vm0.bullet.mail.ne1.yahoo.com [98.138.91.54])
	by yocto-www.yoctoproject.org (Postfix) with SMTP id AFFD3E0027B
	for <meta-ti@yoctoproject.org>; Mon,  9 Jul 2012 12:39:53 -0700 (PDT)
Received: from [98.138.90.54] by nm6.bullet.mail.ne1.yahoo.com with NNFMP;
	09 Jul 2012 19:39:53 -0000
Received: from [98.138.87.7] by tm7.bullet.mail.ne1.yahoo.com with NNFMP;
	09 Jul 2012 19:39:53 -0000
Received: from [127.0.0.1] by omp1007.mail.ne1.yahoo.com with NNFMP;
	09 Jul 2012 19:39:19 -0000
X-Yahoo-Newman-Property: ymail-3
X-Yahoo-Newman-Id: 77883.71978.bm@omp1007.mail.ne1.yahoo.com
Received: (qmail 96129 invoked by uid 60001); 9 Jul 2012 19:39:18 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s1024;
	t=1341862758; bh=sSwXkpdJqnmpPzUB5kFjkipvSIBs2UAciH5J4L1lPeQ=;
	h=X-YMail-OSG:Received:X-Mailer:Message-ID:Date:From:Reply-To:Subject:To:MIME-Version:Content-Type;
	b=TkEZhPXR3lImpKVnRpKJ8ZMVxSUsj499JAcjw9QjnCbZuLfmoXlUtPGCvZ4pZgQ3CqXWgcnxLCqe4i7zb4znlcXEY97gy3FaGiWjwDnAGs4ULDPXf+NoNjw4njT4K8PgBFr6+/+ww+FuCCO4kHMvAIf2nGYX7CBM0dvJ6AJmH8o=
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=s1024; d=yahoo.com;
	h=X-YMail-OSG:Received:X-Mailer:Message-ID:Date:From:Reply-To:Subject:To:MIME-Version:Content-Type;
	b=CCBcAAt1En67NutF9BNRfZxCzXnRmLrIpjGuWmV/9XY4iv9UpohZ3fXKrJ44yLapQEoesF7rWpB3JFtLOea5RVBia2k+hnsRRgytQlfuz7mbqPx3y3X9e5rvLK6ykITSGry1Z2QJrz/s4Iaflu8u+2cEKhLX7RGCmWblPUM6Q1g=;
X-YMail-OSG: mN8yD6MVM1m2rAbM7I3LJ8gBQO364IPknLCWnnf_ErJXMm6
	HTKIa2xe.1k3L.KIqoeK9K1aswKb2BK.XIozpFM0hqiR51nvOTerBYRAnVgu
	FtQu_13LmVb8Yo_lB4xWZXvQBEHPc6gMnmfTjCgSIFuwgre8yIdqtDcFs7OI
	Wj2gapWzRDo9A5QyuGi89_zBIUvlIwr.ibTfA0qnlnFLjbPynQGadXg39uCD
	iPfpZoUpJgIaiLIleZI38CM8bfmvRsEyTwz9NaiZ0RH_QYViVpBQaymo9aw2
	J8o_uX1BVuLhRgvxCc6lCDIPJIYG0oyp.C42JXZZXV5uBF4x8NElj9vNrBNr
	EstGbIEIJ4DWmXsS7o8KBRmogD9a0RWajwF6uf_KGqBpC3zjRJDYZZ3GsC5b
	mZkfVNKVoOBJgDPKz4jL.QTfLWscG6zH.SFx2u11702vFOczi9OmHPdA3eTC
	3frPOrvZJ5HP3HgYodlk5Hj9y96yqq5Kv5hBrhY4IKvNQFhQT60ORUuX.6_P
	OqQOTxr38lVEuuYs05GlFfbLjHYTnrrijEBVCUQB2hJehowFLDmMuJwP5D0u
	heZixzwwVRA.yrj7xAw0-
Received: from [41.239.64.192] by web120202.mail.ne1.yahoo.com via HTTP;
	Mon, 09 Jul 2012 12:39:18 PDT
X-Mailer: YahooMailWebService/0.8.120.356233
Message-ID: <1341862758.65710.YahooMailNeo@web120202.mail.ne1.yahoo.com>
From: Ali Sayed <supernova_7072@yahoo.com>
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 31 Jul 2012 12:58:45 -0700
Subject: ExpansionError during parsing
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
Reply-To: Ali Sayed <supernova_7072@yahoo.com>
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
Date: Mon, 09 Jul 2012 19:39:54 -0000
X-Original-Date: Mon, 9 Jul 2012 12:39:18 -0700 (PDT)
X-List-Received-Date: Mon, 09 Jul 2012 19:39:54 -0000
Content-Type: multipart/alternative;
	boundary="1920933866-967693829-1341862758=:65710"

--1920933866-967693829-1341862758=:65710
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

ERROR: ExpansionError during parsing /yocto/boards/beagle/poky/meta-ti/reci=
pes-ti/codec-engine/ti-codecs-omap3530_4.00.00.00.bb: Failure expanding var=
iable FILESPATH, expression was ${@base_set_filespath([ "/yocto/boards/beag=
le/poky/meta-ti/recipes-ti/codec-engine/ti-codecs-omap3530-4_00_00_00-${MAC=
HINE_KERNEL_PR}a", "/yocto/boards/beagle/poky/meta-ti/recipes-ti/codec-engi=
ne/ti-codecs-omap3530-4_00_00_00", "/yocto/boards/beagle/poky/meta-ti/recip=
es-ti/codec-engine/ti-codecs-omap3530", "/yocto/boards/beagle/poky/meta-ti/=
recipes-ti/codec-engine/ti-codecs-omap3530-4_00_00_00", "/yocto/boards/beag=
le/poky/meta-ti/recipes-ti/codec-engine/ti-codecs-omap3530", "/yocto/boards=
/beagle/poky/meta-ti/recipes-ti/codec-engine/files", "/yocto/boards/beagle/=
poky/meta-ti/recipes-ti/codec-engine" ], d)} which triggered exception Synt=
axError: EOL while scanning string literal (FILESPATH, line 1)=0A=0A=0A=0AI=
 have this error when I tried to build an Angstrom image for beagle board.=
=0AI tried to add this line=A0=0A=A0 =A0 BBMASK =3D ".*/meta-ti/recipes-mis=
c/"=0Ato conf/local.conf file , but the error still there.=0Aalso I saw thi=
s :=A0https://lists.yoctoproject.org/pipermail/meta-ti/2012-June/001279.htm=
l=0Abut my linux.inc is already hasn't require linux-tools.inc

--1920933866-967693829-1341862758=:65710
Content-Type: text/html; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

<html><body><div style=3D"color:#000; background-color:#fff; font-family:ti=
mes new roman, new york, times, serif;font-size:12pt"><div><font face=3D"'t=
imes new roman', 'new york', times, serif">ERROR: ExpansionError during par=
sing /yocto/boards/beagle/poky/meta-ti/recipes-ti/codec-engine/ti-codecs-om=
ap3530_4.00.00.00.bb: Failure expanding variable FILESPATH, expression was =
${@base_set_filespath([ "/yocto/boards/beagle/poky/meta-ti/recipes-ti/codec=
-engine/ti-codecs-omap3530-4_00_00_00-${MACHINE_KERNEL_PR}a", "/yocto/board=
s/beagle/poky/meta-ti/recipes-ti/codec-engine/ti-codecs-omap3530-4_00_00_00=
", "/yocto/boards/beagle/poky/meta-ti/recipes-ti/codec-engine/ti-codecs-oma=
p3530", "/yocto/boards/beagle/poky/meta-ti/recipes-ti/codec-engine/ti-codec=
s-omap3530-4_00_00_00", "/yocto/boards/beagle/poky/meta-ti/recipes-ti/codec=
-engine/ti-codecs-omap3530", "/yocto/boards/beagle/poky/meta-ti/recipes-ti/=
codec-engine/files",
 "/yocto/boards/beagle/poky/meta-ti/recipes-ti/codec-engine" ], d)} which t=
riggered exception SyntaxError: EOL while scanning string literal (FILESPAT=
H, line 1)</font><br></div><div style=3D"font-family: 'times new roman', 'n=
ew york', times, serif; font-size: 12pt; "><br></div><div style=3D"font-fam=
ily: 'times new roman', 'new york', times, serif; font-size: 12pt; "><br></=
div><div style=3D"font-family: 'times new roman', 'new york', times, serif;=
 font-size: 12pt; ">I have this error when I tried to build an Angstrom ima=
ge for beagle board.</div><div><font face=3D"'times new roman', 'new york',=
 times, serif" size=3D"3">I tried to add this line&nbsp;</font></div><div><=
font face=3D"'times new roman', 'new york', times, serif">&nbsp; &nbsp; BBM=
ASK =3D ".*/meta-ti/recipes-misc/"</font></div><div style=3D"font-family: '=
times new roman', 'new york', times, serif; font-size: 12pt; "><span style=
=3D"font-size: 12pt; ">to conf/local.conf file , but the error still
 there.</span></div><div style=3D"font-family: 'times new roman', 'new york=
', times, serif; font-size: 12pt; "><span style=3D"font-size: 12pt; ">also =
I saw this :&nbsp;https://lists.yoctoproject.org/pipermail/meta-ti/2012-Jun=
e/001279.html</span></div><div style=3D"font-family: 'times new roman', 'ne=
w york', times, serif; font-size: 12pt; "><span style=3D"font-size: 12pt; "=
>but my linux.inc is already hasn't require linux-tools.inc</span></div><di=
v style=3D"font-family: 'times new roman', 'new york', times, serif; font-s=
ize: 12pt; "><span style=3D"font-size: 12pt; ">&nbsp;</span></div></div></b=
ody></html>

--1920933866-967693829-1341862758=:65710--
