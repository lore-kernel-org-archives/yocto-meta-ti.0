Return-Path: <koen@dominion.thruhere.net>
Received: from mail-we0-f176.google.com (mail-we0-f176.google.com
	[74.125.82.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BC4A9E013D0
	for <meta-ti@yoctoproject.org>; Mon, 23 Apr 2012 23:35:33 -0700 (PDT)
Received: by werc1 with SMTP id c1so252309wer.35
	for <meta-ti@yoctoproject.org>; Mon, 23 Apr 2012 23:35:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=jnHjmVDT0ACd/ZH1MfcDa4Rs9o5dEXgYGkkAnKZBiss=;
	b=Flm8jPQvj2E89itk1praaX3mZQSrXZ8jY3yX5LktWDd51fftSF7Bb7y5nDvXNoiGc8
	dGZdcCLC+uP764Xqj5gCaFgFBahAtZ880scFJo1CDwROyTIFKUkppgd9OIAieBl1/nCD
	UgLpWrDle9xAEpmXoUOtcMCEfr4aH6UzHoS1zt4KiW41kwYgXC+XKFicPldQO+Xh7YSl
	YDI3kffatLc9mXq8LsyAokQFrIMieYtgvNC89peZctXlKqGlJTIDkrD/Nlcm24pcQApx
	rWFcvEgtUewfiXma4Tl2/S/Nd5bQ+mQytfqPcc3ltJ6dZWrbDxzBSUrI2ESWmcHYhxaE
	CEzA==
Received: by 10.180.76.240 with SMTP id n16mr26776848wiw.10.1335249332268;
	Mon, 23 Apr 2012 23:35:32 -0700 (PDT)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id j3sm43704202wiw.1.2012.04.23.23.35.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 23 Apr 2012 23:35:31 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <20120423210514.GA25685@denix.org>
Date: Tue, 24 Apr 2012 08:35:23 +0200
Message-Id: <8A570E2A-DB37-4140-BE4B-DE37F558AB51@dominion.thruhere.net>
References: <1334849614-12816-1-git-send-email-koen@dominion.thruhere.net>
	<728BA01E-6B0C-4FCC-A30F-75B1923B054F@dominion.thruhere.net>
	<20120423210514.GA25685@denix.org>
To: Denys Dmytriyenko <denis@denix.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQmuw2SNGwvM+ZzT5nh7TSYbw6/T91siUQljETgYynZUvoCH5JLJFUmYocduKwO44jvB1y2N
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH 1/2] cloud9-gnome-image: same as cloud9-image, but with GNOME added to it
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
X-List-Received-Date: Tue, 24 Apr 2012 06:35:34 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 23 apr. 2012, om 23:05 heeft Denys Dmytriyenko het volgende =
geschreven:

> On Mon, Apr 23, 2012 at 10:25:55PM +0200, Koen Kooi wrote:
>> ping on this one, the rest is already in :)
>=20
> Yeah, I know :)
>=20
> I was holding on it, since it adds one more systemd and angstrom =
dependency=20
> and I was working on restructuring the code to separate those things =
into=20
> "extras" sublayer...
>=20
> But since it's around the release time, this restructuring probably =
should be=20
> held until after.

And it's the last patch needed for the beaglebone production release as =
well.

regards,

Koen=

