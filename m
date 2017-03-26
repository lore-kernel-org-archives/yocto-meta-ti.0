Return-Path: <yury.lunev@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CF1C0E009A5; Sun, 26 Mar 2017 10:41:53 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	MIME_QP_LONG_LINE, 
	RCVD_IN_DNSWL_NONE,RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (yury.lunev[at]gmail.com)
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.215.65 listed in dnsbl.sorbs.net]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.215.65 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* 0.0 MIME_QP_LONG_LINE RAW: Quoted-printable line longer than 76 chars
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf0-f65.google.com (mail-lf0-f65.google.com
	[209.85.215.65])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EEA88E009A5
	for <meta-ti@yoctoproject.org>; Sun, 26 Mar 2017 10:41:52 -0700 (PDT)
Received: by mail-lf0-f65.google.com with SMTP id r36so4711932lfi.0
	for <meta-ti@yoctoproject.org>; Sun, 26 Mar 2017 10:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:message-id:mime-version:subject:date:in-reply-to:cc:to
	:references; bh=ql+X6E8IdGFN/Ri97Wpn4eYG885sQ+S9rQHcLrUvqkc=;
	b=Ob3Ousllw/xFPWmwIodPAxAJM3eafeygMr28Begpxp3XNt5FkM7q9eVBiSCE/ybjdE
	7wJgorOD1ZfPDJNwanKJ+vCXPrwJ4zRgON8wIYE2jjjKwRVwHJRkwpkBFCdVprq3/SFn
	FI6NARTQ793dXScsmQt1WbTBYAd75lixDl6iD8Bfaj7+r5hgXmp+/AE8qmcWiDJDmoEv
	dHsGL3XqOkvW9qd0qpJW8dyCrGIeKl+mxk8wLIpJEfQd31iT40ghc5/7TYXMxP233HZ8
	Ebj8at07XkyaBbIHs0+VFR35aDbjOt9dTQPzXNXJxdwSw4qdFfAjVmtVbadIJnOLOg4q
	ik3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:message-id:mime-version:subject:date
	:in-reply-to:cc:to:references;
	bh=ql+X6E8IdGFN/Ri97Wpn4eYG885sQ+S9rQHcLrUvqkc=;
	b=uK6DC4gsV6ax1O3bQ8Iv8E+4aRR1uVrA60IrY46kz8GkhcWbiyVWtURohYih68KPJ+
	DMl3xKrqQ340UkYyGntpom3iXriMtu+ovJhZryLZE13xX3w6Ahvj2eAXPl0bX8NrfAxR
	7Rt02GOo/3NHkS7MCEyCb/O6MGzmjl1EH8ZFFEu3wFh7ZDX3VjR92iZGVL04tDPITKj7
	tc8wnw0fbU0R8rOT9WxjCUXmoYveYhBY+tWFHb67FP1CJlW/mPBj/imUI3Ttm1nisPIU
	Hxr3gwLZ+pnBQkCed+G08Xgg5thV2v+t75DrlbFIPD49RxQrTn4HYzfJEiot648lkKFN
	v51Q==
X-Gm-Message-State: AFeK/H1sxQNi5u50RvSRc4T3mQdZQQRnh8MeOiMhv+CDF2IMwtq+1yQEmYul0953C5J0tA==
X-Received: by 10.25.228.131 with SMTP id x3mr8050734lfi.125.1490550111529;
	Sun, 26 Mar 2017 10:41:51 -0700 (PDT)
Received: from [192.168.1.3] ([31.23.55.122]) by smtp.gmail.com with ESMTPSA id
	b145sm1478389lfg.45.2017.03.26.10.41.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 26 Mar 2017 10:41:50 -0700 (PDT)
From: Yury Luneff <yury.lunev@gmail.com>
Message-Id: <DC609EBE-9306-49A9-94AB-116C9E60CD1B@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 10.2 \(3259\))
Date: Sun, 26 Mar 2017 20:41:48 +0300
In-Reply-To: <698E70FE-FEC5-4D18-A474-E32176B34F91@gmail.com>
To: meta-ti@yoctoproject.org
References: <698E70FE-FEC5-4D18-A474-E32176B34F91@gmail.com>
X-Mailer: Apple Mail (2.3259)
Subject: Re: Weston not starting up with SGX drivers on BeagleBone Black
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
X-List-Received-Date: Sun, 26 Mar 2017 17:41:53 -0000
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_A2F99AE7-7146-4EAC-88A2-F745A11A9712"

--Apple-Mail=_A2F99AE7-7146-4EAC-88A2-F745A11A9712
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Hello again.

I seem to resolved this issue. I had to set initial video mode for =
tilcdc to be 1024x768@60 Hz in uEnv.txt. Then Weston started nicely with =
=E2=80=94current-mode being 1024x768.

26 =D0=BC=D0=B0=D1=80=D1=82=D0=B0 2017 =D0=B3., =D0=B2 4:30, Yury Luneff =
<yury.lunev@gmail.com> =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB(=D0=B0):=

>=20
> Hello!
>=20
> I=E2=80=99m trying to get Weston running on BeagleBone Black with =
TI=E2=80=99s SGX drivers. Kernel is 4.9.13-g102f61776e from meta-ti =
(morty branch) and the drivers alike.
> I have Weston 1.11 with patches from meta-arago (the patch that forces =
using card0 whereas I have card0 for tilcdc and card1 for pvrsrvkm plus =
the Mesa/GBM dealing patch). I had it running with SGX drivers already, =
but all of a sudden it ceased to startup properly.
>=20
> # weston --tty=3D1 -B drm-backend.so --current-mode
> =E2=80=A6
> [16:07:05.845] Output HDMI-A-1, (connector 26, crtc 24)
>               mode 1360x768@60.4, preferred, current
> ...
> [16:07:05.957] set mode failed: Invalid argument
>=20
> I=E2=80=99ve posted complete Weston startup log here: =
http://pastebin.com/bHbdDMas
>=20
> The failure reason is listed in dmesg log:
> tilcdc 4830e000.lcdc: Invalid pitch: fb and crtc widths must be the =
same
>=20
> I see the patch comments in =
https://patchwork.kernel.org/patch/7856821/ that introduced this sanity =
check for tilcdc, but I=E2=80=99m not sure how to achieve proper setup =
with my case.
>=20
> I have put 'gbm-format=3Drgb565=E2=80=99 in /etc/weston.ini. =
tilcdc=E2=80=99s pixel format seems to be the same: =
/sys/bus/platform/drivers/tilcdc/4830e000.lcdc/graphics/fb0/bits_per_pixel=
 equals to 16.
>=20
> I=E2=80=99m not sure how tilcdc and pvrsrvkm should work between each =
other but the result is weston/wayland not starting because of some =
framebuffer mode conflict.
>=20
> I had it working very little time ago and I did it by specifying =
--current-mode for Weston, but now this option doesn=E2=80=99t help as =
Weston tries to set_mode anyway.
>=20
> Please, give me an advice on how to debug this.
>=20
> Thanks!
> =E2=80=94
> Yury Lunev
>=20
>=20

=E2=80=94
Yury Lunev


--Apple-Mail=_A2F99AE7-7146-4EAC-88A2-F745A11A9712
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D""><div class=3D"">Hello again.</div><div class=3D""><br =
class=3D""></div>I seem to resolved this issue. I had to set initial =
video mode for tilcdc to be 1024x768@60 Hz in uEnv.txt. Then Weston =
started nicely with =E2=80=94current-mode being 1024x768.<div =
class=3D""><br class=3D""></div><div class=3D"">26 =D0=BC=D0=B0=D1=80=D1=82=
=D0=B0 2017 =D0=B3., =D0=B2 4:30, Yury Luneff &lt;<a =
href=3D"mailto:yury.lunev@gmail.com" =
class=3D"">yury.lunev@gmail.com</a>&gt; =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=
=D0=BB(=D0=B0):<br class=3D""><div><blockquote type=3D"cite" =
class=3D""><br class=3D"Apple-interchange-newline"><div class=3D""><div =
class=3D"">Hello!<br class=3D""><br class=3D"">I=E2=80=99m trying to get =
Weston running on BeagleBone Black with TI=E2=80=99s SGX drivers. Kernel =
is 4.9.13-g102f61776e from meta-ti (morty branch) and the drivers =
alike.<br class=3D"">I have Weston 1.11 with patches from meta-arago =
(the patch that forces using card0 whereas I have card0 for tilcdc and =
card1 for pvrsrvkm plus the Mesa/GBM dealing patch). I had it running =
with SGX drivers already, but all of a sudden it ceased to startup =
properly.<br class=3D""><br class=3D""># weston --tty=3D1 -B =
drm-backend.so --current-mode<br class=3D"">=E2=80=A6<br =
class=3D"">[16:07:05.845] Output HDMI-A-1, (connector 26, crtc 24)<br =
class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;mode 1360x768@60.4, preferred, current<br class=3D"">...<br =
class=3D"">[16:07:05.957] set mode failed: Invalid argument<br =
class=3D""><br class=3D"">I=E2=80=99ve posted complete Weston startup =
log here: <a href=3D"http://pastebin.com/bHbdDMas" =
class=3D"">http://pastebin.com/bHbdDMas</a><br class=3D""><br =
class=3D"">The failure reason is listed in dmesg log:<br class=3D"">tilcdc=
 4830e000.lcdc: Invalid pitch: fb and crtc widths must be the same<br =
class=3D""><br class=3D"">I see the patch comments in <a =
href=3D"https://patchwork.kernel.org/patch/7856821/" =
class=3D"">https://patchwork.kernel.org/patch/7856821/</a> that =
introduced this sanity check for tilcdc, but I=E2=80=99m not sure how to =
achieve proper setup with my case.<br class=3D""><br class=3D"">I have =
put 'gbm-format=3Drgb565=E2=80=99 in /etc/weston.ini. tilcdc=E2=80=99s =
pixel format seems to be the same: =
/sys/bus/platform/drivers/tilcdc/4830e000.lcdc/graphics/fb0/bits_per_pixel=
 equals to 16.<br class=3D""><br class=3D"">I=E2=80=99m not sure how =
tilcdc and pvrsrvkm should work between each other but the result is =
weston/wayland not starting because of some framebuffer mode =
conflict.<br class=3D""><br class=3D"">I had it working very little time =
ago and I did it by specifying --current-mode for Weston, but now this =
option doesn=E2=80=99t help as Weston tries to set_mode anyway.<br =
class=3D""><br class=3D"">Please, give me an advice on how to debug =
this.<br class=3D""><br class=3D"">Thanks!<br class=3D"">=E2=80=94<br =
class=3D"">Yury Lunev<br class=3D""><br class=3D""><br =
class=3D""></div></div></blockquote></div><br class=3D""><div class=3D"">
<div style=3D"color: rgb(0, 0, 0); letter-spacing: normal; orphans: =
auto; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D""><div style=3D"color: rgb(0, 0, 0); letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D""><div style=3D"color: rgb(0, 0, 0); letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D"">=E2=80=94<br class=3D"">Yury Lunev</div></div></div>
</div>
<br class=3D""></div></body></html>=

--Apple-Mail=_A2F99AE7-7146-4EAC-88A2-F745A11A9712--
