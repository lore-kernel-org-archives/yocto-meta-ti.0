Return-Path: <munoz0raul@gmail.com>
Received: from mail-bk0-f45.google.com (mail-bk0-f45.google.com
	[209.85.214.45]) (using TLSv1 with cipher RC4-SHA (128/128 bits))
	(No client certificate requested)
	by yocto-www.yoctoproject.org (Postfix) with ESMTPS id 82417E01457;
	Mon, 18 Feb 2013 03:56:08 -0800 (PST)
Received: by mail-bk0-f45.google.com with SMTP id i18so2484808bkv.32
	for <multiple recipients>; Mon, 18 Feb 2013 03:56:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=wOw+2WdevIPjoXPY1sQ1rs69DlEAf0ljwLBqWx3n4Gs=;
	b=W9sqZl7K/Q0wR1qhz0QlNdNxZaCA2d8eIzUTbIJL8ajEknOTXuAimq7lcO/Lrnj/98
	22jTXoCIj2rcYkBRYt8+gXI6UfFXHZWJ//FcBseeIahrFOdxfnx08/4TZgILLI4NHs9q
	NA2rhjRJJ3FPeogI3SBcgVOfVFFFXkYIFMfxfLVz/Xdmtqbn06EFwevowcP0h5W4sdvo
	Ls12dg5Jq7eG9lQLqYx9Wtsulizx4XKPuExDF6g4ObT8vVoLo4cwxQEhdhCLgt6Mjghc
	kBNOVAKHhfgqGNr+GpSmke+0nX0OQhnuEp/3734GLDCY1nCmygWxnESpn8nubJcIKwFo
	w+eg==
MIME-Version: 1.0
X-Received: by 10.205.119.19 with SMTP id fs19mr4549079bkc.105.1361188566461; 
	Mon, 18 Feb 2013 03:56:06 -0800 (PST)
Received: by 10.204.128.205 with HTTP; Mon, 18 Feb 2013 03:56:06 -0800 (PST)
In-Reply-To: <CANmVirhviFJ8c8RKTLwgmvuwHp4KWkWt3+2dZozE+iemUSztQw@mail.gmail.com>
References: <CANmViriV1_tAO+j_nTkpZjcSRD8dh2ALXwHVs1QC-9_dDmrfFA@mail.gmail.com>
	<20130212191553.GA1858@denix.org>
	<CANmViriOFXRsW10XWXk8vJpCEQgTgq2VGr4A+Roa0SYVz9Z2DQ@mail.gmail.com>
	<20130214160030.GD2539@edge>
	<CANmVirgL6Fte5cP+VTdK4aTb4sBB1AXQOq=02DtaiNnRePfwPw@mail.gmail.com>
	<20130214162854.GF2539@edge>
	<CANmVirhviFJ8c8RKTLwgmvuwHp4KWkWt3+2dZozE+iemUSztQw@mail.gmail.com>
Date: Mon, 18 Feb 2013 08:56:06 -0300
Message-ID: <CANmViri6ZGaY1+_a06Zu+CXgJVNhfc8-5UQ23RFgC2fn-MNCiw@mail.gmail.com>
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
X-List-Received-Date: Mon, 18 Feb 2013 11:56:09 -0000
Content-Type: multipart/alternative; boundary=0015173fedfaf9ee6404d5fe6893

--0015173fedfaf9ee6404d5fe6893
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Any suggestions?

I really do not know what to do, the file "/lib/udev/firmware" never appear=
.

Thank you.


2013/2/14 Raul Rosetto Munoz <munoz0raul@gmail.com>

> Now Im with 173 from meta-fsl bbapend, but I tryed with many others from
> meta-oe and poky.
>
>
>
>
>
>
> 2013/2/14 Denys Dmytriyenko <denys@ti.com>
>
>> On Thu, Feb 14, 2013 at 02:23:14PM -0200, Raul Rosetto Munoz wrote:
>> > Denys,
>> > There are something strange,
>> >
>> > First there are no  linux-firmware-{rtl8192cu,rtl8192ce,rtl8192su}
>> > installed at rfs.
>>
>> I was talking about packages, looks like you have them already installed=
.
>>
>>
>> > raul@phi04:.../tmp/deploy/images$ find
>> > /media/ed86e6a2-20c2-464e-a2f3-f28ff48983ef/lib/firmware/ -name "*8192=
*"
>> > /media/ed86e6a2-20c2-464e-a2f3-f28ff48983ef/lib/firmware/RTL8192E
>> >
>> /media/ed86e6a2-20c2-464e-a2f3-f28ff48983ef/lib/firmware/rtlwifi/rtl8192=
sefw.bin
>> >
>> /media/ed86e6a2-20c2-464e-a2f3-f28ff48983ef/lib/firmware/rtlwifi/rtl8192=
defw.bin
>> >
>> > Another problem is that "/lib/udev/firmware" are not installed to.
>> >
>> > raul@phi04:.../tmp/deploy/images$ find
>> > /media/ed86e6a2-20c2-464e-a2f3-f28ff48983ef/lib/udev/ -name "*firmware=
*"
>> > raul@phi04:.../tmp/deploy/images$
>>
>> What is your udev version?
>>
>>
>> > But I can see theses files at my "tmp/sysroots/beaglebone"
>> >
>> > raul@phi04:.../tmp/sysroots/beaglebone$ find lib/firmware/ -name
>> "*8192*"
>> > lib/firmware/RTL8192E
>> > lib/firmware/rtlwifi/rtl8192sefw.bin
>> > lib/firmware/rtlwifi/rtl8192defw.bin
>> > lib/firmware/rtlwifi/rtl8192cfw.bin
>> > lib/firmware/rtlwifi/rtl8192cufw.bin
>> >
>> > raul@phi04:.../tmp/sysroots/beaglebone$ find lib/udev/ -name
>> "*firmware*"
>> > lib/udev/firmware
>> > lib/udev/rules.d/50-firmware.rules
>> >
>> > I tryed copy this files for the sdcard but doesnt work.
>> >
>> > Do you have any suggest?
>> >
>> > Thanks for all help.
>>
>
>
>
> --
> *Raul Rosetto Mu=F1oz*
>



--=20
*Raul Rosetto Mu=F1oz*

--0015173fedfaf9ee6404d5fe6893
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>Any suggestions?</div><div><br></div><div>I real=
ly do not know what to do, the file &quot;/lib/udev/firmware&quot; never ap=
pear.</div><div><br></div><div>Thank you.</div></div></div><div class=3D"gm=
ail_extra">
<br><br><div class=3D"gmail_quote">2013/2/14 Raul Rosetto Munoz <span dir=
=3D"ltr">&lt;<a href=3D"mailto:munoz0raul@gmail.com" target=3D"_blank">muno=
z0raul@gmail.com</a>&gt;</span><br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<div dir=3D"ltr">Now Im with 173 from meta-fsl bbapend, but I tryed with ma=
ny others from meta-oe and poky.<div><br></div><div><br><div><br></div><div=
><br></div></div></div><div class=3D"gmail_extra"><div><div class=3D"h5"><b=
r>
<br><div class=3D"gmail_quote">
2013/2/14 Denys Dmytriyenko <span dir=3D"ltr">&lt;<a href=3D"mailto:denys@t=
i.com" target=3D"_blank">denys@ti.com</a>&gt;</span><br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">

<div>On Thu, Feb 14, 2013 at 02:23:14PM -0200, Raul Rosetto Munoz wrote:<br=
>
&gt; Denys,<br>
&gt; There are something strange,<br>
&gt;<br>
&gt; First there are no =A0linux-firmware-{rtl8192cu,rtl8192ce,rtl8192su}<b=
r>
&gt; installed at rfs.<br>
<br>
</div>I was talking about packages, looks like you have them already instal=
led.<br>
<div><br>
<br>
&gt; raul@phi04:.../tmp/deploy/images$ find<br>
&gt; /media/ed86e6a2-20c2-464e-a2f3-f28ff48983ef/lib/firmware/ -name &quot;=
*8192*&quot;<br>
&gt; /media/ed86e6a2-20c2-464e-a2f3-f28ff48983ef/lib/firmware/RTL8192E<br>
&gt; /media/ed86e6a2-20c2-464e-a2f3-f28ff48983ef/lib/firmware/rtlwifi/rtl81=
92sefw.bin<br>
&gt; /media/ed86e6a2-20c2-464e-a2f3-f28ff48983ef/lib/firmware/rtlwifi/rtl81=
92defw.bin<br>
&gt;<br>
&gt; Another problem is that &quot;/lib/udev/firmware&quot; are not install=
ed to.<br>
&gt;<br>
&gt; raul@phi04:.../tmp/deploy/images$ find<br>
&gt; /media/ed86e6a2-20c2-464e-a2f3-f28ff48983ef/lib/udev/ -name &quot;*fir=
mware*&quot;<br>
&gt; raul@phi04:.../tmp/deploy/images$<br>
<br>
</div>What is your udev version?<br>
<div><div><br>
<br>
&gt; But I can see theses files at my &quot;tmp/sysroots/beaglebone&quot;<b=
r>
&gt;<br>
&gt; raul@phi04:.../tmp/sysroots/beaglebone$ find lib/firmware/ -name &quot=
;*8192*&quot;<br>
&gt; lib/firmware/RTL8192E<br>
&gt; lib/firmware/rtlwifi/rtl8192sefw.bin<br>
&gt; lib/firmware/rtlwifi/rtl8192defw.bin<br>
&gt; lib/firmware/rtlwifi/rtl8192cfw.bin<br>
&gt; lib/firmware/rtlwifi/rtl8192cufw.bin<br>
&gt;<br>
&gt; raul@phi04:.../tmp/sysroots/beaglebone$ find lib/udev/ -name &quot;*fi=
rmware*&quot;<br>
&gt; lib/udev/firmware<br>
&gt; lib/udev/rules.d/50-firmware.rules<br>
&gt;<br>
&gt; I tryed copy this files for the sdcard but doesnt work.<br>
&gt;<br>
&gt; Do you have any suggest?<br>
&gt;<br>
&gt; Thanks for all help.<br>
</div></div></blockquote></div><br><br clear=3D"all"><div><br></div></div><=
/div><span class=3D"HOEnZb"><font color=3D"#888888">-- <br><b>Raul Rosetto =
Mu=F1oz</b>
</font></span></div>
</blockquote></div><br><br clear=3D"all"><div><br></div>-- <br><b>Raul Rose=
tto Mu=F1oz</b>
</div>

--0015173fedfaf9ee6404d5fe6893--
