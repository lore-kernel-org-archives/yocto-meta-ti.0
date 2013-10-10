Return-Path: <bmentink@gmail.com>
Received: from mail-ie0-f171.google.com (mail-ie0-f171.google.com
	[209.85.223.171])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EB701E01652
	for <meta-ti@yoctoproject.org>; Thu, 10 Oct 2013 13:42:19 -0700 (PDT)
Received: by mail-ie0-f171.google.com with SMTP id at1so6298524iec.16
	for <meta-ti@yoctoproject.org>; Thu, 10 Oct 2013 13:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=YiqIhPy/9xL1hrSDVzSZL8WrqbJMGXn9PuvFJyhq0pA=;
	b=0Y6jG6JBTbu2GKoVYjscQlKr8P4Xj6j7ywqXdSMFKM97b1WiPz6zdfle6Y5LESzTpJ
	65sfKFu9F2DKXfQpqEONYTaNIHbiviC5Bcar0m5wIrej4gkyKrSHCb88R/A7sjsOgZle
	PdJsg1SZ8Yw7EwQQ4zuQ4kIfLtaT14/PEnS95PEpc1aO2wDquSLoa+JFsUVx7E2ZW3NP
	J14UnPDF4CCGiXbK8llU8y1wlt75fK94HpQ+NQujiEfI+bSBrwN4xgeKWn+yFdh9pj7K
	YB8JmzoUIP9h2pXthjVecKF08BqGt1YkOt2d/ilCsc8OnM9WPmGimJf8wSqv3cu/vOzK
	fhSA==
MIME-Version: 1.0
X-Received: by 10.50.136.200 with SMTP id qc8mr106693igb.52.1381437738338;
	Thu, 10 Oct 2013 13:42:18 -0700 (PDT)
Received: by 10.43.83.9 with HTTP; Thu, 10 Oct 2013 13:42:18 -0700 (PDT)
Date: Fri, 11 Oct 2013 09:42:18 +1300
Message-ID: <CALEed8Zi5wEX53+Fx4G0hXUpPwFX-feSbt+Vyu1CAvVUMDuV2A@mail.gmail.com>
From: Bernard Mentink <bmentink@gmail.com>
To: meta-ti@yoctoproject.org
Subject: Loading CAN modules on boot
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
X-List-Received-Date: Thu, 10 Oct 2013 20:42:20 -0000
Content-Type: multipart/alternative; boundary=089e0122a812ac55dc04e869098b

--089e0122a812ac55dc04e869098b
Content-Type: text/plain; charset=ISO-8859-1

Hi All,

I am having trouble getting can modules loaded on boot on my Beaglebone
Black.

I can get the can device to show if I load the following modules in this
order:

can-dev.ko
c_can.ko
c_can_platform.ko  and

can.ko
can_raw.ko

I do not know how to get these modules loaded at boot.

I tried re-configuring my kernel to have them built-in, but that did not
work.
I placed a defconfig file in my layer with the changes but it does not seem
to get picked up as it should according to the yocto docs. The .config on
the build directory is still the old one.

Any idea's?

Thanks,
Bernie

--089e0122a812ac55dc04e869098b
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi All,<div><br></div><div>I am having trouble getting can=
 modules loaded on boot on my Beaglebone Black.</div><div><br></div><div>I =
can get the can device to show if I load the following modules in this orde=
r:</div>
<div><br></div><div>can-dev.ko</div><div>c_can.ko</div><div>c_can_platform.=
ko =A0and</div><div><br></div><div>can.ko</div><div>can_raw.ko</div><div><b=
r></div><div>I do not know how to get these modules loaded at boot.</div>
<div><br></div><div>I tried re-configuring my kernel to have them built-in,=
 but that did not work.</div><div>I placed a defconfig file in my layer wit=
h the changes but it does not seem to get picked up as it should according =
to the yocto docs. The .config on the build directory is still the old one.=
</div>
<div><br></div><div>Any idea&#39;s?</div><div><br></div><div>Thanks,</div><=
div>Bernie</div></div>

--089e0122a812ac55dc04e869098b--
