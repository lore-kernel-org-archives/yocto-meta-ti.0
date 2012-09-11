Return-Path: <koen@dominion.thruhere.net>
Received: from mail-we0-f176.google.com (mail-we0-f176.google.com
	[74.125.82.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D1E32E00344
	for <meta-ti@yoctoproject.org>; Mon, 10 Sep 2012 23:20:47 -0700 (PDT)
Received: by weyu3 with SMTP id u3so100371wey.35
	for <meta-ti@yoctoproject.org>; Mon, 10 Sep 2012 23:20:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=fbHnHywgaztLkVFWau4+fAhqcMwEeqr6UCW266SNX5s=;
	b=Qzq2lSfkSQ/WYKw3cUMhP7A69fAvNfpJGKU3tFCf2fASq3cC5cO+fO5UsDf5mY08fn
	gLV8aTlo5j+88ZnD6GU9jIKxCIkjaUBaIMwamszO/k2nyVgyu+bkkJjZEeTjM53gzRHg
	MbeFjK/xjSUCEUunB9+tJZI4nqw0jM1qhCUJfe+YAQtMYehqY8eCnMkGgTIWVktSlYSj
	l+Ac5lisaGMMW2oewoyLWdIz6B/h113EaH0evlESdAs5H4z956M2AKY/paYvJosx977N
	b2e+DznzbqxbuFmV4JDfdz9euHCLDMXBsz5lDxnkWgPafpFcRsKGjsuuxwMYedAHLSOZ
	ThQg==
Received: by 10.180.14.8 with SMTP id l8mr22665584wic.6.1347344446331;
	Mon, 10 Sep 2012 23:20:46 -0700 (PDT)
Received: from [172.20.0.10] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id v3sm1035302wiw.7.2012.09.10.23.20.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 10 Sep 2012 23:20:45 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.0 \(1486\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1347330377-10755-1-git-send-email-fcooper@ti.com>
Date: Tue, 11 Sep 2012 08:20:44 +0200
Message-Id: <D88D285C-1A83-49A1-A61E-4FA672CBF97A@dominion.thruhere.net>
References: <1347330377-10755-1-git-send-email-fcooper@ti.com>
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
X-Mailer: Apple Mail (2.1486)
X-Gm-Message-State: ALoCoQmGIDFTjjkEtFZkzxHpaOHSstjMXsHHJcyZxlgkkmVVZNOXN24GMlHB0fWCJsfgpFrr8/PL
Subject: Re: [PATCH] am33x-cm3: Don't compile binary
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
X-List-Received-Date: Tue, 11 Sep 2012 06:20:48 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 11 sep. 2012, om 04:26 heeft Franklin S. Cooper Jr =
<fcooperjr27@gmail.com> het volgende geschreven:

> * Building from source needs to be tested. For now use prebuilt binary
>  which has been validated.


NAK, if there are problems they need to get reported and fixed. =
Handwaving about that there *might* be bugs is unproductive and wrong.=

