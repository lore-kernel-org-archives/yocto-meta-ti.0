Return-Path: <munoz0raul@gmail.com>
Received: from mail-ie0-f169.google.com (mail-ie0-f169.google.com
	[209.85.223.169]) (using TLSv1 with cipher RC4-SHA (128/128 bits))
	(No client certificate requested)
	by yocto-www.yoctoproject.org (Postfix) with ESMTPS id C6308E003BC;
	Thu, 14 Feb 2013 08:23:26 -0800 (PST)
Received: by mail-ie0-f169.google.com with SMTP id 13so3563404iea.0
	for <multiple recipients>; Thu, 14 Feb 2013 08:23:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=7ohoRAlz5OX347V2WNQHY5u2FZ2ZhrafoEpRf0H2YzY=;
	b=V3ZeJJuMb+z79AlvVsHJdbAyAJ4AP0m4sEcAtMClug+mAu/i1iTL3tTTAj7Ku9E9k+
	fi4NLOitURcdpz3aMOJmTAztLPVhcM6qfHXolgT3OSyFnHxrVRDSrx8kRfkunzhoarPg
	mMcR3edaonKV0rQqaLRhXMD9t6vjngQZ7I9o53sd2CTSOnVKbWRZoQbtELA+/9oU4+Sx
	DorMZB4fIxUsnw6GQ8WLU80N8znPHa49pOzGzgVsPhwg0l7t4XRqxqJvdbMDQbKzqdpl
	i/23ueL3PJRcIzXp0NpFIzzVXTeq/EvKxrndIQzkegMZS1HSixPqQrCWk8LzB9+ZTND6
	iPpg==
MIME-Version: 1.0
X-Received: by 10.42.140.72 with SMTP id j8mr35259082icu.37.1360858995073;
	Thu, 14 Feb 2013 08:23:15 -0800 (PST)
Received: by 10.64.147.40 with HTTP; Thu, 14 Feb 2013 08:23:14 -0800 (PST)
In-Reply-To: <20130214160030.GD2539@edge>
References: <CANmViriV1_tAO+j_nTkpZjcSRD8dh2ALXwHVs1QC-9_dDmrfFA@mail.gmail.com>
	<20130212191553.GA1858@denix.org>
	<CANmViriOFXRsW10XWXk8vJpCEQgTgq2VGr4A+Roa0SYVz9Z2DQ@mail.gmail.com>
	<20130214160030.GD2539@edge>
Date: Thu, 14 Feb 2013 14:23:14 -0200
Message-ID: <CANmVirgL6Fte5cP+VTdK4aTb4sBB1AXQOq=02DtaiNnRePfwPw@mail.gmail.com>
From: Raul Rosetto Munoz <munoz0raul@gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>,
	"yocto@yoctoproject.org" <yocto@yoctoproject.org>
Subject: Re: Wifi Module + udev configs
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
X-List-Received-Date: Thu, 14 Feb 2013 16:23:27 -0000
Content-Type: multipart/alternative; boundary=90e6ba6e8be8fda41404d5b1ac20

--90e6ba6e8be8fda41404d5b1ac20
Content-Type: text/plain; charset=ISO-8859-1

Denys,
There are something strange,

First there are no  linux-firmware-{rtl8192cu,rtl8192ce,rtl8192su}
installed at rfs.

raul@phi04:.../tmp/deploy/images$ find
/media/ed86e6a2-20c2-464e-a2f3-f28ff48983ef/lib/firmware/ -name "*8192*"
/media/ed86e6a2-20c2-464e-a2f3-f28ff48983ef/lib/firmware/RTL8192E
/media/ed86e6a2-20c2-464e-a2f3-f28ff48983ef/lib/firmware/rtlwifi/rtl8192sefw.bin
/media/ed86e6a2-20c2-464e-a2f3-f28ff48983ef/lib/firmware/rtlwifi/rtl8192defw.bin

Another problem is that "/lib/udev/firmware" are not installed to.

raul@phi04:.../tmp/deploy/images$ find
/media/ed86e6a2-20c2-464e-a2f3-f28ff48983ef/lib/udev/ -name "*firmware*"
raul@phi04:.../tmp/deploy/images$

But I can see theses files at my "tmp/sysroots/beaglebone"

raul@phi04:.../tmp/sysroots/beaglebone$ find lib/firmware/ -name "*8192*"
lib/firmware/RTL8192E
lib/firmware/rtlwifi/rtl8192sefw.bin
lib/firmware/rtlwifi/rtl8192defw.bin
lib/firmware/rtlwifi/rtl8192cfw.bin
lib/firmware/rtlwifi/rtl8192cufw.bin

raul@phi04:.../tmp/sysroots/beaglebone$ find lib/udev/ -name "*firmware*"
lib/udev/firmware
lib/udev/rules.d/50-firmware.rules

I tryed copy this files for the sdcard but doesnt work.

Do you have any suggest?

Thanks for all help.

--90e6ba6e8be8fda41404d5b1ac20
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Denys,</div><div>There are something strange,</div><d=
iv><br></div><div>First there are no =A0linux-firmware-{rtl8192cu,rtl8192ce=
,rtl8192su} installed at rfs.</div><div><br></div><div><font face=3D"&#39;c=
ourier new&#39;, monospace">raul@phi04:.../tmp/deploy/images$ find /media/e=
d86e6a2-20c2-464e-a2f3-f28ff48983ef/lib/firmware/ -name &quot;*8192*&quot;<=
/font></div>
<div><font face=3D"&#39;courier new&#39;, monospace">/media/ed86e6a2-20c2-4=
64e-a2f3-f28ff48983ef/lib/firmware/RTL8192E</font></div><div><font face=3D"=
&#39;courier new&#39;, monospace">/media/ed86e6a2-20c2-464e-a2f3-f28ff48983=
ef/lib/firmware/rtlwifi/rtl8192sefw.bin</font></div>
<div><font face=3D"&#39;courier new&#39;, monospace">/media/ed86e6a2-20c2-4=
64e-a2f3-f28ff48983ef/lib/firmware/rtlwifi/rtl8192defw.bin</font></div><div=
><br></div><div>Another problem is that &quot;/lib/udev/firmware&quot; are =
not installed to.</div>
<div><br></div><div><font face=3D"&#39;courier new&#39;, monospace">raul@ph=
i04:.../tmp/deploy/images$ find /media/ed86e6a2-20c2-464e-a2f3-f28ff48983ef=
/lib/udev/ -name &quot;*firmware*&quot;</font></div><div><font face=3D"&#39=
;courier new&#39;, monospace">raul@phi04:.../tmp/deploy/images$=A0</font></=
div>
<div><br></div><div>But I can see theses files at my &quot;tmp/sysroots/bea=
glebone&quot;</div><div><br></div><div><font face=3D"&#39;courier new&#39;,=
 monospace">raul@phi04:.../tmp/sysroots/beaglebone$ find lib/firmware/ -nam=
e &quot;*8192*&quot;</font></div>
<div><font face=3D"&#39;courier new&#39;, monospace">lib/firmware/RTL8192E<=
/font></div><div><font face=3D"&#39;courier new&#39;, monospace">lib/firmwa=
re/rtlwifi/rtl8192sefw.bin</font></div><div><font face=3D"&#39;courier new&=
#39;, monospace">lib/firmware/rtlwifi/rtl8192defw.bin</font></div>
<div><font face=3D"&#39;courier new&#39;, monospace">lib/firmware/rtlwifi/r=
tl8192cfw.bin</font></div><div><font face=3D"&#39;courier new&#39;, monospa=
ce">lib/firmware/rtlwifi/rtl8192cufw.bin</font></div><div><font face=3D"&#3=
9;courier new&#39;, monospace"><br>
</font></div><div><font face=3D"&#39;courier new&#39;, monospace">raul@phi0=
4:.../tmp/sysroots/beaglebone$ find lib/udev/ -name &quot;*firmware*&quot;<=
/font></div><div><font face=3D"&#39;courier new&#39;, monospace">lib/udev/f=
irmware</font></div>
<div><font face=3D"&#39;courier new&#39;, monospace">lib/udev/rules.d/50-fi=
rmware.rules</font></div><div><br></div><div>I tryed copy this files for th=
e sdcard but doesnt work.</div><div><br></div><div>Do you have any suggest?=
</div>
<div><br></div><div>Thanks for all help.</div><div><br></div><div><br></div=
><div><br></div></div>

--90e6ba6e8be8fda41404d5b1ac20--
