Return-Path: <dasty82@gmail.com>
Received: from mail-ob0-f176.google.com (mail-ob0-f176.google.com
	[209.85.214.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B95A1E01423
	for <meta-ti@yoctoproject.org>; Wed, 13 Jun 2012 01:48:43 -0700 (PDT)
Received: by obbef5 with SMTP id ef5so697022obb.35
	for <meta-ti@yoctoproject.org>; Wed, 13 Jun 2012 01:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type;
	bh=I17MFcmRUCegg4FKaFhgKKqVpJ8p3XxFTjugeSxYh64=;
	b=z45NBW8bePxGRkYcH09raWWvK5pHD0MGjto3taHYRE9DHW6Fo340+bS676MTaTHx9S
	Bt81B0FLlNq/3e7m7wsfvt2J6UxQGz74PJGxbo4crpCoy0cjadlGTpJxFWy5bObMNIFU
	JlFxwKj7Cc9YA0ziowIvNHoHCNMAQtVrTQhCjlaIIHd1TOkwdjecAWFwm3kMTTgObaQC
	DnQ7Fm+01C1CkSN59Y+7yBFMAQLcdJL0rL68Red8RieoHb3wdHaPxdedVMW8s1RnbK70
	hc4NTF6SLq5fUDUXWJENmo0zuObFQtXIc79r+pIVBcUKbpdpBPpCrNIN2qrVy2zqRV9Z
	qpVw==
MIME-Version: 1.0
Received: by 10.182.152.73 with SMTP id uw9mr23871347obb.0.1339577323018; Wed,
	13 Jun 2012 01:48:43 -0700 (PDT)
Sender: dasty82@gmail.com
Received: by 10.76.1.73 with HTTP; Wed, 13 Jun 2012 01:48:42 -0700 (PDT)
Date: Wed, 13 Jun 2012 10:48:42 +0200
X-Google-Sender-Auth: Kgxp_eir-pQSlT5z26toVHUqzPo
Message-ID: <CAOpW-VBsoZ1O0qxDtd=sGAmFC0KZzi4FQhzpXvQOK7ru70_UzA@mail.gmail.com>
From: Radek Dostal <rd@radekdostal.com>
To: meta-ti@yoctoproject.org
Subject: BeagleBone and suspend to RAM
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Wed, 13 Jun 2012 08:48:43 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi Everybody,

First of all thank you very much for recent patches, which fix the
problems with suspend to RAM on beaglebone!

When using rev897596 we managed to get beaglebone to sleep, but it
still did not wake up. In order to be able to wake it up, we had to disable
CONFIG_THUMB2_KERNEL.

Anybody has an idea what can be causing this problem? Does anybody here
experience the same problem? Does wakeup from suspend to RAM work for
anybody with THUMB2 enabled?

We have acceptable workaround by disabling THUMB2, but knowing the
source of the problem would be great.

Thanks,
Radek

