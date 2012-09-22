Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CE1C8E002AB
	for <meta-ti@yoctoproject.org>; Fri, 21 Sep 2012 21:43:24 -0700 (PDT)
Received: by wibhi8 with SMTP id hi8so2011926wib.11
	for <meta-ti@yoctoproject.org>; Fri, 21 Sep 2012 21:43:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=h0q92gTheU9SNct6d9L8kTRpvWWsekCRmfZ90+QAyD4=;
	b=O1Y5AKXf9i4DQOMa9rXTBuNp/KgdcLVnic9dDuYorC7+LH0hFu2HPdLEnUc4kv6xeT
	yFcKUMUAloONDnDK/hf4Zw0Epm7DyJiBAEr1mjYkrgrTMyQ7c2nULC3YdIsni7op02Wb
	gBxuX4frEFHuWDc5f3jzU594Yk7k8zKkZ4aCZFZ9fC8NQVwhqZ2vy16kPM+mn5dTsjyS
	eqBD8xLs5b97o5D4eJX97XJ53VUrmPYLDdSk2oxbeXp+RPkHc10amWTACiWE3KTuaLD3
	1BAH24mcgkyOh3GLsF8bupNfbQ+mWlPfGjMMq2YClNS+qoVyga55/5yRw9piSJJ5Vc8C
	v8dw==
Received: by 10.180.79.103 with SMTP id i7mr1012192wix.13.1348289001053;
	Fri, 21 Sep 2012 21:43:21 -0700 (PDT)
Received: from [172.20.0.10] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id k2sm1658671wiz.7.2012.09.21.21.43.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 21 Sep 2012 21:43:20 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.1 \(1498\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1348273383-26479-1-git-send-email-fcooper@ti.com>
Date: Sat, 22 Sep 2012 06:43:17 +0200
Message-Id: <0FBB2B4A-2C24-44D5-8453-190826E1EBD3@dominion.thruhere.net>
References: <1348273383-26479-1-git-send-email-fcooper@ti.com>
To: Franklin S. Cooper Jr <fcooperjr27@gmail.com>
X-Mailer: Apple Mail (2.1498)
X-Gm-Message-State: ALoCoQkRE63zMGOJpSltWcFa14yJuoycfRH86UyGjUxF/cFSj9HW6OhCi2DGZ7PI9dZTEV5/ucX6
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] bt-firmware: Port bt-firmware recipe
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
X-List-Received-Date: Sat, 22 Sep 2012 04:43:25 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 22 sep. 2012, om 02:23 heeft Franklin S. Cooper Jr =
<fcooperjr27@gmail.com> het volgende geschreven:

> * Port bt-firmware recipe from arago.
> * Bt-firmware provides the bluetooth firmware for the TI wl12xx
>  Wi+Fi + Bluetooth module.

What is the difference between this and the linux-firmware recipe?=

