Return-Path: <bmentink@gmail.com>
Received: from mail-ie0-f180.google.com (mail-ie0-f180.google.com
	[209.85.223.180])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A5D94E013D1
	for <meta-ti@yoctoproject.org>; Tue, 27 Aug 2013 20:59:53 -0700 (PDT)
Received: by mail-ie0-f180.google.com with SMTP id x14so7829224ief.39
	for <meta-ti@yoctoproject.org>; Tue, 27 Aug 2013 20:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=U+mRR5xRVSpp6WFnXqIqCNvbpiJSVIaOmVePCwhylQQ=;
	b=wgJqIix7amruOGCoA9VQddoJjSJgMAI2SO6Gkl6GqiQhDoN8kGZ19oZL+Nq0DMaCOY
	sFKMInv05N2zCIKfa1+CZDZr06yni8m6hMCCFBvviizt3MXaqSB8vAu6S4PoHuqG6v2l
	G17I5jqbGCV4qV8+qEmNiJIGEXeE73Y948T6N29CExotvWlmupR1ddbDbz2GKUuUzNcF
	p6ByPV87PolJc4W13MO+4BexTT5T9PlqRP9f9unF9c67BWxl5e/daEhqwwmc8Rob6EOm
	LqzW5bLBqFFfDwmLIrJWHUMTANtkNWdiU2RDvqX2urfyEN0SdT+02O0ShUynflKSnhv8
	Z1gA==
MIME-Version: 1.0
X-Received: by 10.50.33.38 with SMTP id o6mr11021525igi.52.1377662392679; Tue,
	27 Aug 2013 20:59:52 -0700 (PDT)
Received: by 10.43.83.9 with HTTP; Tue, 27 Aug 2013 20:59:52 -0700 (PDT)
Date: Wed, 28 Aug 2013 15:59:52 +1200
Message-ID: <CALEed8ZJcHWLZnfLovhCADpwAk_0LwdM3xNEx4qYvz48CSC00w@mail.gmail.com>
From: Bernard Mentink <bmentink@gmail.com>
To: meta-ti@yoctoproject.org
Subject: Making SPI device visible on beaglebone black
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
X-List-Received-Date: Wed, 28 Aug 2013 03:59:57 -0000
Content-Type: multipart/alternative; boundary=089e01537f208947ae04e4fa0586

--089e01537f208947ae04e4fa0586
Content-Type: text/plain; charset=ISO-8859-1

Hi All,

I see that there is no /dev/spixx device on the BBB, can anyone tell me how
to enable it?
I do see that there is no mux'ing of the SPI pins in the kernel or any
patch file. Is it just simply adding the mux'ing, or is there something
else I need to do to get the devices to show.

The drivers are there (kernel & user-spave) in the kernel.

Cheers,
Bernie

--089e01537f208947ae04e4fa0586
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi All,<div><br></div><div>I see that there is no /dev/spi=
xx device on the BBB, can anyone tell me how to enable it?</div><div>I do s=
ee that there is no mux&#39;ing of the SPI pins in the kernel or any patch =
file. Is it just simply adding the mux&#39;ing, or is there something else =
I need to do to get the devices to show.</div>
<div><br></div><div>The drivers are there (kernel &amp; user-spave) in the =
kernel.</div><div><br></div><div>Cheers,</div><div>Bernie</div></div>

--089e01537f208947ae04e4fa0586--
