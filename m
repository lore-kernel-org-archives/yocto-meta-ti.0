Return-Path: <winiston@futuraautomation.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B3228E00C7D; Fri, 18 Mar 2016 05:56:33 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HTML_MESSAGE,RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.192.182 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-pf0-f182.google.com (mail-pf0-f182.google.com
	[209.85.192.182])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4206CE00C76
	for <meta-ti@yoctoproject.org>; Fri, 18 Mar 2016 05:56:30 -0700 (PDT)
Received: by mail-pf0-f182.google.com with SMTP id u190so167603218pfb.3
	for <meta-ti@yoctoproject.org>; Fri, 18 Mar 2016 05:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=futuraautomation-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:from:to:subject:date:mime-version:importance
	:disposition-notification-to;
	bh=IlqPzXU94YLheH/vrtjbWxAF5HfLKNV72Zm8gY3c400=;
	b=Tepks4VhdKCNp2BQi8DuG7LGwEbUCvlqHZnVaB246Okdy3mb27TJoVZ9594X2MHGWc
	rAqFnsYkI3p+LmdNcbjFOf3P0aN568Fzj7y1qa3gxlpf6rDnNHTuJIxDTBDx+O/ITaWQ
	iYF1e5vGiApP4ogF1nwfhamdhpnBXcdrhQD9sZRlqd5eH86VEdJ5Ok6QdgwY8XupHUUo
	b3gIxLsfYIV44P1GWYQuGagTGLc7RkOjdt3hcr/uV0VLl4zCcXi5K7lCL/b7mKx7BkWw
	GJcQ6keBs6/sMdCuK1DTbFmdVEkkaMd7DUMrMS9WNM++0rTGa8j7rqCmHszWKWP8QUfM
	5elQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:from:to:subject:date:mime-version
	:importance:disposition-notification-to;
	bh=IlqPzXU94YLheH/vrtjbWxAF5HfLKNV72Zm8gY3c400=;
	b=I9nEpY4rBjPI0HhPdOX7xEVedB47oeeoBSUVMOfVt2XjPbQKU3IYiqtPzmJfCwISCO
	QGbSeGsQTnDeBV4Po+iTsNkKUGLWaTZNXJwuTLZ1on612ahhqz6xFLhCfmJqgWx0FACW
	urBLOnRbTd6bDhuTbOMLz/4Je8HOaPw6pkDoRX5szx2e1m9yqjAPdsct8yAAbtfJ87/v
	ghC6ia+x6fQLzCZ2LJ3YEBGjvjXeBUjVvxpDbQKyPWt9FgVSu3Lt5Ulh/V+ptSKCRU0C
	AKJQVmvoFp+UyQq2i8bCggiAlVPJXbofrledTMPp+n4+CmYISva25F8QwMIDYAAXTNQi
	yJIg==
X-Gm-Message-State: AD7BkJIKoaLb+YnObZztNEpoE3Jar4gDvs1/r1o6XT2v5vqjo8SNwQ48ixBLLLmhaBSYvQ==
X-Received: by 10.66.199.66 with SMTP id ji2mr23564053pac.34.1458305789982;
	Fri, 18 Mar 2016 05:56:29 -0700 (PDT)
Received: from RD3 ([59.99.236.185]) by smtp.gmail.com with ESMTPSA id
	k65sm20981059pfb.30.2016.03.18.05.56.27
	for <meta-ti@yoctoproject.org>
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 18 Mar 2016 05:56:28 -0700 (PDT)
Message-ID: <10B94A5433F64C11829D4535BC314F65@RD3>
From: <winiston@futuraautomation.com>
To: "yocto texas" <meta-ti@yoctoproject.org>
Date: Fri, 18 Mar 2016 18:29:46 +0530
MIME-Version: 1.0
X-Priority: 1
X-MSMail-Priority: High
Importance: High
X-Mailer: Microsoft Windows Live Mail 15.4.3555.308
X-MimeOLE: Produced By Microsoft MimeOLE V15.4.3555.308
Subject: Layer Branch (Jethro/Master) issue with meta-ti
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
X-List-Received-Date: Fri, 18 Mar 2016 12:56:33 -0000
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0138_01D18144.26190C30"

------=_NextPart_000_0138_01D18144.26190C30
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Dear,

I am trying to build  yocto project poky distribution with =
=E2=80=9Cmeta-ti=E2=80=9D layer and =E2=80=9Cmeta-oe layer=E2=80=9D(Open =
Embedded ).=20

The following branch I am using to build the image.

Poky -----Jethro branch
meta-ti     ----- Master branch
meta-oe -----Jethro branch
Target machine : AM437x-evm
Host machine  : Ubuntu 14.04
Command:      bitbake qt4e-demo-image

=E2=80=9Cmeta-oe=E2=80=9D layer is added in the bblayers.conf because I =
wanted to use =E2=80=9CNavit=E2=80=9D in my build. =
=E2=80=9CNavit=E2=80=9D is appended in the local.conf also.
When I compile, it gives the following error.=20

ERROR: Task 268 =
(/home/winiston/poky/meta-oe/recipes-navigation/navit/navit_svn.bb, =
do_compile) failed with exit code '1'

1. Is it possible to compile meta-ti (master) with meta-oe (jethro)?

2. How do I build =E2=80=9Cqt4e-demo-image=E2=80=9D with =
=E2=80=9Cmeta-oe=E2=80=9D and =E2=80=9Cmeta-ti=E2=80=9D ?

I am ready to provide log file and required details if require. Thanks =
in advance...

Regards,
Winiston.P
Futura Automation Pvt Ltd.

Ph :91-80-28375290 / 28375295
Fax :91-80-28375291

------=_NextPart_000_0138_01D18144.26190C30
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<HTML><HEAD></HEAD>
<BODY dir=3Dltr>
<DIV dir=3Dltr>
<DIV style=3D"FONT-SIZE: 12pt; FONT-FAMILY: 'Calibri'; COLOR: #000000">
<DIV>Dear,</DIV>
<DIV>&nbsp;</DIV>
<DIV>I am trying to build&nbsp; yocto project poky distribution with =
=E2=80=9Cmeta-ti=E2=80=9D=20
layer and =E2=80=9Cmeta-oe layer=E2=80=9D(Open Embedded ). </DIV>
<DIV>&nbsp;</DIV>
<DIV>The following branch I am using to build the image.</DIV>
<DIV>&nbsp;</DIV>
<DIV>Poky -----Jethro branch</DIV>
<DIV>meta-ti&nbsp;&nbsp;&nbsp;&nbsp; ----- Master branch</DIV>
<DIV>meta-oe -----Jethro branch</DIV>
<DIV>Target machine : AM437x-evm</DIV>
<DIV>Host machine&nbsp; : Ubuntu 14.04</DIV>
<DIV>Command:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bitbake =
qt4e-demo-image</DIV>
<DIV>&nbsp;</DIV>
<DIV>=E2=80=9Cmeta-oe=E2=80=9D layer is added in the bblayers.conf =
because I wanted to use=20
=E2=80=9CNavit=E2=80=9D in my build. =E2=80=9CNavit=E2=80=9D is appended =
in the local.conf also.</DIV>
<DIV>When I compile, it gives the following error. </DIV>
<DIV>&nbsp;</DIV>
<DIV>ERROR: Task 268=20
(/home/winiston/poky/meta-oe/recipes-navigation/navit/navit_svn.bb, =
do_compile)=20
failed with exit code '1'</DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT color=3D#0000ff>1. Is it possible to compile meta-ti (master) =
with=20
meta-oe (jethro)?</FONT></DIV>
<DIV><FONT color=3D#0000ff></FONT>&nbsp;</DIV>
<DIV><FONT color=3D#0000ff>2. How do I build =
=E2=80=9Cqt4e-demo-image=E2=80=9D with =E2=80=9Cmeta-oe=E2=80=9D and=20
=E2=80=9Cmeta-ti=E2=80=9D ?</FONT></DIV>
<DIV><FONT color=3D#0000ff></FONT>&nbsp;</DIV>
<DIV><FONT color=3D#0000ff>I am ready to provide log file and required =
details if=20
require. Thanks in advance...</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV>Regards,<BR>Winiston.P<BR>Futura Automation Pvt Ltd.<BR><BR>Ph=20
:91-80-28375290 / 28375295<BR>Fax=20
:91-80-28375291<BR></DIV></DIV></DIV></BODY></HTML>

------=_NextPart_000_0138_01D18144.26190C30--
