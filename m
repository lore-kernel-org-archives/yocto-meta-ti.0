Return-Path: <ankur.tyagi85@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 90577E00A7D; Wed, 12 Aug 2015 03:56:25 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (ankur.tyagi85[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.218.50 listed in list.dnswl.org]
Received: from mail-oi0-f50.google.com (mail-oi0-f50.google.com
	[209.85.218.50])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 53BCCE00A26
	for <meta-ti@yoctoproject.org>; Wed, 12 Aug 2015 03:56:19 -0700 (PDT)
Received: by oip136 with SMTP id 136so6871218oip.1
	for <meta-ti@yoctoproject.org>; Wed, 12 Aug 2015 03:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to:content-type;
	bh=w9g35dNgCcZrlanb4WUX6l3YtGJM9gwlvH/ww/RhKuY=;
	b=fnieWbKj4m/sTbcXBt3UEIoPK5AhYqNEXAEzMe/zJl+BHvAy/qsBuVCkeCeYpFR2nb
	WG529oLy87Ni5O3AMmKmJiumtFLdknF+S1mYTLF3Jt86+ZIcP1/XKzVMlpvKMWVT3EBe
	0TyOlV8Pw8G+aKiWs9TSTR4+kY1avYZF+SCBkT5a2Tr1TpR7UHHCxW6l19lPoXtQMzQS
	v1etXdJeckAZLMFpGscPpbC3Gf9kyZxfXTIMM97pkPoJK8Im/4yT2CTGnUIt3vo+t7Wz
	30giWCIfI4r3vWM+EXbyFhXAh/izLeT+N79gBVi1PjiRCaxxUnx27WlzmfPFlUj3CsJL
	RNgg==
X-Received: by 10.202.49.145 with SMTP id x139mr10474701oix.81.1439376978805; 
	Wed, 12 Aug 2015 03:56:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.86.131 with HTTP; Wed, 12 Aug 2015 03:55:59 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Wed, 12 Aug 2015 22:55:59 +1200
Message-ID: <CADySD0G+uCE7w_4krEfcjbAkOFoBwuqUh=rrU=ewhbS66sKCMQ@mail.gmail.com>
To: meta-ti@yoctoproject.org
Subject: how to reduce time from power ON to kernel
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
X-List-Received-Date: Wed, 12 Aug 2015 10:56:25 -0000
Content-Type: multipart/alternative; boundary=001a113cda40850906051d1b1193

--001a113cda40850906051d1b1193
Content-Type: text/plain; charset=UTF-8

Hi,

I am using AM335x EVM and want to reduce the time from Power ON to kernel
boot.

So basically I want to speed-up the two stage boot process from
MLO->u-boot->Kernel

I don't want to handle anything in u-boot, so I can bypass that.

Can you help on how I can achieve MLO -> Kernel ?

thanks
Ankur

--001a113cda40850906051d1b1193
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:georgia,=
serif;font-size:small;color:#333399">Hi,</div><div class=3D"gmail_default" =
style=3D"font-family:georgia,serif;font-size:small;color:#333399"><br></div=
><div class=3D"gmail_default" style=3D"font-family:georgia,serif;font-size:=
small;color:#333399">I am using AM335x EVM and want to reduce the time from=
 Power ON to kernel boot.</div><div class=3D"gmail_default" style=3D"font-f=
amily:georgia,serif;font-size:small;color:#333399"><br></div><div class=3D"=
gmail_default" style=3D"font-family:georgia,serif;font-size:small;color:#33=
3399">So basically I want to speed-up the two stage boot process from MLO-&=
gt;u-boot-&gt;Kernel</div><div class=3D"gmail_default" style=3D"font-family=
:georgia,serif;font-size:small;color:#333399"><br></div><div class=3D"gmail=
_default" style=3D"font-family:georgia,serif;font-size:small;color:#333399"=
>I don&#39;t want to handle anything in u-boot, so I can bypass that.</div>=
<div class=3D"gmail_default" style=3D"font-family:georgia,serif;font-size:s=
mall;color:#333399"><br></div><div class=3D"gmail_default" style=3D"font-fa=
mily:georgia,serif;font-size:small;color:#333399">Can you help on how I can=
 achieve MLO -&gt; Kernel ?</div><div class=3D"gmail_default" style=3D"font=
-family:georgia,serif;font-size:small;color:#333399"><br></div><div class=
=3D"gmail_default" style=3D"font-family:georgia,serif;font-size:small;color=
:#333399">thanks</div><div class=3D"gmail_default" style=3D"font-family:geo=
rgia,serif;font-size:small;color:#333399">Ankur</div>
</div>

--001a113cda40850906051d1b1193--
