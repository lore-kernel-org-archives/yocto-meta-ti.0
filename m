Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ey0-f176.google.com (mail-ey0-f176.google.com
	[209.85.215.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E1470E011AD
	for <meta-ti@yoctoproject.org>; Tue,  7 Aug 2012 08:32:14 -0700 (PDT)
Received: by eabd1 with SMTP id d1so787855eab.35
	for <meta-ti@yoctoproject.org>; Tue, 07 Aug 2012 08:32:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=EJ2YiJUjB+j1JY4A39kfuA+dS+ZwqnmodYYP/Yl1ZZQ=;
	b=fdOeHl6w0BAOSoAXd9obVHoFQ7jvWFJ4YDrUFh5N7mC1adzzL3T8gbrKy3zhLEbyjb
	L0MFYVjcsOKEXcX9wHlk6YupW1xBp5nhtbuJ3mPmml0DT4FznPw7YOFmisvMSh0dlDuX
	NffJTifxD5FRN8aaoFo86SMzjCcDoNtI40knLe/PuhWV4vTuYj5/JDIh33a49mwmA1Zz
	qYmJujrd2qZMdvOicU2PVzoucaRuFeEdEM5C3JBcDyYGddATqI/ev9+GnPCAemkFyoMb
	h/zwqD8FP5GIhejQV83NPVgyUgoE0T00x95SPbsW0ODkqSVjQsX2/U1RWW6mdaJB15iI
	8iow==
Received: by 10.14.181.132 with SMTP id l4mr18310757eem.17.1344353533951;
	Tue, 07 Aug 2012 08:32:13 -0700 (PDT)
Received: from ?IPv6:2001:610:612::cc97:7ad6:f5c2:543f?
	([2001:610:612:0:cc97:7ad6:f5c2:543f])
	by mx.google.com with ESMTPS id a48sm17659305eeo.1.2012.08.07.08.32.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 07 Aug 2012 08:32:12 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.0 \(1485\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <20120807153016.GA8716@edge>
Date: Tue, 7 Aug 2012 17:32:36 +0200
Message-Id: <015A9197-70E1-4195-BA85-71097586D635@dominion.thruhere.net>
References: <5020D9A0.30000@communistcode.co.uk> <20120807153016.GA8716@edge>
To: Denys Dmytriyenko <denys@ti.com>
X-Mailer: Apple Mail (2.1485)
X-Gm-Message-State: ALoCoQnBr+kZWru3fcjUYXVomHQ00upQ+tYgSec28bYG1AI1zsB55P9eVhXTfswyDwsaA6yju2Yo
Cc: meta-ti@yoctoproject.org
Subject: Re: Turning off kernel config option
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
X-List-Received-Date: Tue, 07 Aug 2012 15:32:15 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 7 aug. 2012, om 17:30 heeft Denys Dmytriyenko <denys@ti.com> het =
volgende geschreven:

> On Tue, Aug 07, 2012 at 10:02:24AM +0100, Jack Mitchell wrote:
>> I am trying to turn of CONFIG_SPI_DEBUG in the beaglebone BSP from
>> meta-ti. I am using the poky distro configuration and I have changed
>> the defconfig in
>> meta-ti/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/defconfig
>> but it still builds with CONFIG_SPI_DEBUG enabled.
>=20
> That should be the correct location, please make sure you re-do the =
unpack=20
> task - if you previously built the kernel with the old defconfig, it =
will be=20
> stored in the work directory and won't be copied from the repository =
above,=20
> until you repeat the do_unpack task, i.e. by clenaing the build.

Or just increment PR as you're supposed to, it's an output change after =
all. No need to check anything if you do it properly :)=

