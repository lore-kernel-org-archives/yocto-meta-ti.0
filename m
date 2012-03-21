Return-Path: <koen@dominion.thruhere.net>
Received: from mail-we0-f176.google.com (mail-we0-f176.google.com
	[74.125.82.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CF9A5E00747
	for <meta-ti@yoctoproject.org>; Wed, 21 Mar 2012 08:14:36 -0700 (PDT)
Received: by werc1 with SMTP id c1so1426212wer.35
	for <meta-ti@yoctoproject.org>; Wed, 21 Mar 2012 08:14:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=sJFIfAw8maEKaaUoOkfaIqQZQ59Qmuo0YxGyVNk1fLo=;
	b=W6wEGDymPtFSsrx+BN4vDXDah8TqXsV3SH+X9AY6QRCKE31bAv0EgE3B6DgSkX6FyK
	v6TUNPDALqh/jPIa5mcFdAJcF2bs4g/Fx6XH2WVgSRpRidWdGX8oHNF3fNWrIlV7Ritn
	SzRZpfB4HyriyBpfTBlZ3VwBJS96ZY5k6YmsK+TNaFiniq+CKEwB9sasl1k8+0dlouqo
	vC2omwoGDaCmm7B2PN3XhciEWq5a6jXvWhvBjwy20/doWxx9i2qm93zdDXzzlYB2TUOK
	YyHKibhTzL0lB45P9M/K1t1wYWc8GVRY+Wv7I8f8zt3UxyvhCYJfWdHCokPqG4F0Szhn
	E4jQ==
Received: by 10.180.101.136 with SMTP id fg8mr39166701wib.4.1332342874767;
	Wed, 21 Mar 2012 08:14:34 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id ff9sm5244779wib.2.2012.03.21.08.14.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 21 Mar 2012 08:14:33 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CALKp9+Z+pk6GZR2UPwToxCLGsKw0FO-Jj4nOnXEocSfFWwZBzg@mail.gmail.com>
Date: Wed, 21 Mar 2012 16:14:31 +0100
Message-Id: <E4FB558B-EFEA-42DF-B108-2EBB6B9B405D@dominion.thruhere.net>
References: <CALKp9+Z+pk6GZR2UPwToxCLGsKw0FO-Jj4nOnXEocSfFWwZBzg@mail.gmail.com>
To: Marco Monguzzi <marco.monguzzi@gmail.com>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQlCaWysiz/IkxJnd6lklCCdkjhqs9+GsUjLlJW7/FMu2mOoJ/0gnWFXyvFZ34yhx0d8RGm2
Cc: meta-ti@yoctoproject.org
Subject: Re: question on meta-ti for yocto
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
X-List-Received-Date: Wed, 21 Mar 2012 15:14:37 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 21 mrt. 2012, om 15:58 heeft Marco Monguzzi het volgende geschreven:

> Dear Sirs,
>=20
> I am dumping this mail to ask for some clarifications. I am looking =
closely to yocto as environment for=20
> building embedded linux distro for omap based boards.

Yocto or poky? If you're after yocto, just follow the instructions in =
the README, that will get you that using the yocto framework. If you're =
after poky, that's something completely different.

regards,

Koen=

