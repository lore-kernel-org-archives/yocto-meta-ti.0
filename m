Return-Path: <winiston@futuraautomation.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 086E4E00BFE; Sun, 31 Jan 2016 20:15:42 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HTML_MESSAGE,RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.192.178 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-pf0-f178.google.com (mail-pf0-f178.google.com
	[209.85.192.178])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CD7B9E00BEF
	for <meta-ti@yoctoproject.org>; Sun, 31 Jan 2016 20:15:38 -0800 (PST)
Received: by mail-pf0-f178.google.com with SMTP id 65so76113806pfd.2
	for <meta-ti@yoctoproject.org>; Sun, 31 Jan 2016 20:15:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=futuraautomation-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:from:to:subject:date:mime-version:content-type
	:importance:disposition-notification-to;
	bh=ruaIKVGmnLVPe5UHW1sVbL3yRIA4CzX58ab25vIQG2w=;
	b=ulnIlnimuEdwX6b3SWXN6IqyPeUKnhCd+m7GP8fetQD1x8SP0OL3x1GdpK6a5hmosG
	hfd7JadVMeDg6jv0d0WflqTmgQ8UldIJDpNIP84aKZjKiBAXEkr20cc9S2yv9FksMhJG
	IHWSrudKq6AIc2uD+fxjGIfUzVOtT6Aa0wu2Z7geWeWOezUmwZZ2YF7a5rrRtAzv17nm
	vhsfDlmisQBjGvoS8aJlhDDqpoCDl5veN/SIY6S/Ey10sGcAvWTLljkOtY65Mosjywxy
	PXd13KakBQ5mtbyRjPfik5dgTjIR0oDl7uenX80hyuVcNtZy56qUJgyI7qPnIf0rK4Au
	Kf4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:from:to:subject:date:mime-version
	:content-type:importance:disposition-notification-to;
	bh=ruaIKVGmnLVPe5UHW1sVbL3yRIA4CzX58ab25vIQG2w=;
	b=SRy7jn4v/QmsoVNoheYfgJUUoabj6xDfb/yePgzEgnHPRFGfIOLB/qzMGEyhgR4tIh
	Sk8ZmE/gq5CPcVYUtnsIhynHybHSFWJDoHSWH/RirP13lIWaZrangfB9Q+qn14t/z17g
	3NhWjTMJeqw7H1GBeikQczBhLUpW9XnFg0f3RTNPRYnkGGs5fzT+qY9Tc70/XUWKPQFh
	VPUJ9vxpFEw1fTB8L6jPpYQtUr3wDgW5Furpt7yu2T7+eUp4b95iZbpNt5/14BfqQwOB
	tj8LfFwwXxnG0TBfNi+Xq+0D+BQUgonxrAGFZlJFYaQm9LXhawJFLBWMwlvlPPvX1j04
	xUWQ==
X-Gm-Message-State: AG10YOQYtyRGqTekLdwvZjY8MzASF5OLLlcOj24i4F3Ee5W7vQ+aJehTeq3fpdDzn32S8A==
X-Received: by 10.98.73.6 with SMTP id w6mr23418373pfa.82.1454300137663;
	Sun, 31 Jan 2016 20:15:37 -0800 (PST)
Received: from RD3 ([59.99.236.185]) by smtp.gmail.com with ESMTPSA id
	c87sm39102460pfj.41.2016.01.31.20.15.35
	for <meta-ti@yoctoproject.org>
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 31 Jan 2016 20:15:36 -0800 (PST)
Message-ID: <F3717D3DA0F34B72A567796CC4DFB882@RD3>
From: <winiston@futuraautomation.com>
To: "yocto texas" <meta-ti@yoctoproject.org>
Date: Mon, 1 Feb 2016 09:49:48 +0530
MIME-Version: 1.0
X-Priority: 1
X-MSMail-Priority: High
Importance: High
X-Mailer: Microsoft Windows Live Mail 15.4.3555.308
X-MimeOLE: Produced By Microsoft MimeOLE V15.4.3555.308
Subject: Problem to write core-image-minimal of AM437x-evm on SD card
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
X-List-Received-Date: Mon, 01 Feb 2016 04:15:42 -0000
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_002D_01D15CD5.E3BA93A0"

------=_NextPart_000_002D_01D15CD5.E3BA93A0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Dear,

I have successfully built core-minimal image of AM437x-evm using poky. =
The following files have been created under =
/tmp/deploy/images/am437x-evm directory.
  a.. core-image-minimal-am437x-evm.tar.bz2=20
  b.. core-image-minimal-am437x-evm.tar.gz=20
  c.. core-image-minimal-am437x-evm-20160127052452.rootfs.tar.gz=20
  d.. MLO=20
  e.. MLO-am437x-evm=20
  f.. u-boot.img=20
  g.. u-boot-am437x-evm.img=20
  h.. zImage=20
  i.. =
zImage--4.1.15+git0+b7b07f10f6-r3f-am43x-epos-evm-20160127052452.dtb
and many more files have been created. I wanted to write it on the sd =
card. How do I copy the images to sd card? I did not find any command to =
write the image. Kindly help me out to write the image on sd card. I =
could not go further to develop my project. I would be very thankful if =
you give me detail procedure to solve this issue.

Awaiting your valuable reply. Thanking you.


Regards,
Winiston.P
Futura Automation Pvt Ltd.

Ph :91-80-28375290 / 28375295
Fax :91-80-28375291

------=_NextPart_000_002D_01D15CD5.E3BA93A0
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<HTML><HEAD></HEAD>
<BODY dir=3Dltr>
<DIV dir=3Dltr>
<DIV style=3D"FONT-SIZE: 12pt; FONT-FAMILY: 'Calibri'; COLOR: #000000">
<DIV>Dear,</DIV>
<DIV>&nbsp;</DIV>
<DIV>I have successfully built core-minimal image of AM437x-evm using =
poky. The=20
following files have been created under /tmp/deploy/images/am437x-evm=20
directory.</DIV>
<UL>
  <LI>core-image-minimal-am437x-evm.tar.bz2=20
  <LI>core-image-minimal-am437x-evm.tar.gz=20
  <LI>core-image-minimal-am437x-evm-20160127052452.rootfs.tar.gz=20
  <LI>MLO=20
  <LI>MLO-am437x-evm=20
  <LI>u-boot.img=20
  <LI>u-boot-am437x-evm.img=20
  <LI>zImage=20
  =
<LI>zImage--4.1.15+git0+b7b07f10f6-r3f-am43x-epos-evm-20160127052452.dtb<=
/LI></UL>
<DIV>and many more files have been created.<FONT color=3D#0000ff> I =
wanted to=20
write it on the sd card</FONT>. <FONT color=3D#0000ff>How do I copy the =
images to=20
sd card?</FONT> I did not find any command to write the image. <FONT=20
color=3D#0000ff>Kindly help me out to write the image on sd card</FONT>. =
I could=20
not go further to develop my project. I would be very thankful if you =
give me=20
detail procedure to solve this issue.</DIV>
<DIV>&nbsp;</DIV>
<DIV>Awaiting your valuable reply. Thanking you.</DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;</DIV>
<DIV=20
style=3D"FONT-SIZE: 12pt; FONT-FAMILY: 'Calibri'; COLOR: =
#000000">Regards,<BR>Winiston.P<BR>Futura=20
Automation Pvt Ltd.<BR><BR>Ph :91-80-28375290 / 28375295<BR>Fax=20
:91-80-28375291<BR></DIV></DIV></DIV></BODY></HTML>

------=_NextPart_000_002D_01D15CD5.E3BA93A0--
