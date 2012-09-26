Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 81C01E013EF
	for <meta-ti@yoctoproject.org>; Wed, 26 Sep 2012 08:03:03 -0700 (PDT)
Received: by wibhm2 with SMTP id hm2so706886wib.11
	for <meta-ti@yoctoproject.org>; Wed, 26 Sep 2012 08:03:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=AYTcHx4ZKq+SaMtRlU7cqO44jNCV/cnqACDWvQ225b0=;
	b=YpxusWtYw6yay1NAQ61DgXuecpRrKdI2FN5RRuAbeeXeUmz2nVtyr1hYL9qvJROo7/
	cbSeS4UxjBxZF9jHgkvqRgsioZUzdKKAsvyvFYkPDrSqwQu99t0F/qVNGgyvoVaferiT
	jFRiyPh2h7CcVTDrlY7pMsRtw2bFf94CUsAdF6FmRXe/yPTVSbHiKg+7CNzR/frd1OgM
	JpErps0qugKphrQhmnrFdFOp2FpO4em8kKnazVoT97b6On5r3gCJxHhhV2QSjVflID9Y
	7YRchsUvfImJByB3rlgSdQs6zsQhOO4IqPcacWXkFPKwCbDRR5vV99P11ukYOp2Im9rU
	DtOA==
Received: by 10.180.87.74 with SMTP id v10mr2042062wiz.21.1348671780346;
	Wed, 26 Sep 2012 08:03:00 -0700 (PDT)
Received: from [172.20.0.10] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id dm3sm7358989wib.3.2012.09.26.08.02.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 26 Sep 2012 08:02:59 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.1 \(1498\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <2615887.flnt2fa7s2@travel.area51>
Date: Wed, 26 Sep 2012 17:02:59 +0200
Message-Id: <05707592-E35E-4853-945F-2AA6CDBA3D39@dominion.thruhere.net>
References: <2615887.flnt2fa7s2@travel.area51>
To: Helio Chissini de Castro <helio.chissini.de.castro@collabora.co.uk>
X-Mailer: Apple Mail (2.1498)
X-Gm-Message-State: ALoCoQng9cQtPWLtdWXKKKvfuKcOxLT3MzGYSiEv1fKRbLAe7SSE2KnXAfV581M5KcqhG+SlcfLH
Cc: meta-ti@yoctoproject.org
Subject: Re: Generate sdcard image ?
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
X-List-Received-Date: Wed, 26 Sep 2012 15:03:03 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 26 sep. 2012, om 16:41 heeft Helio Chissini de Castro =
<helio.chissini.de.castro@collabora.co.uk> het volgende geschreven:

> Hi
>=20
> Few months ago, Ot=E1vio Salvador sent a bunch of patches to enable =
sdcard image=20
> generation on Yocto for Freescale.
>=20
> We're planning to do the same for Pandaboard, but seens his patch was =
not=20
> accepted and we still have only tar.bz2 image created ( at least on =
Denzil )
>=20
> Is there any plan upstream to add it ? Otherwise we will give a shot =
to add=20
> support based on Ot=E1vio works and submit upstream again.

The output produced by that patch failed to boot, that's why it wasn't =
accepted.=

