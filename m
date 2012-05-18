Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wg0-f42.google.com (mail-wg0-f42.google.com [74.125.82.42])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E2415E01422
	for <meta-ti@yoctoproject.org>; Fri, 18 May 2012 05:56:08 -0700 (PDT)
Received: by wgbds11 with SMTP id ds11so821818wgb.5
	for <meta-ti@yoctoproject.org>; Fri, 18 May 2012 05:56:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=OlY1yVCRko3SF2lHdsmwSXzlsd0/JYtGz6/NFELT8rs=;
	b=AopbxdUnj7nQlM0lABdEeVaQwdVHkIBOBAjfM0pBJRvL3u9KZX4nYOfna9TdIPo7gV
	AIoJsEJpbj3kxaBIpOkk1znScdsjpO1EWLTMWRkRLlRg8+gZKHONzk7In0ZiytBv/Z70
	tVmiPdTRB+dJJuxy5VoHvU6hYTgKdG1SBiT5u09ywRLSy27/VXrWtfFeFsaytIlOqJkE
	ynXnKeBNk+niGC4OaeYEJrLccEaHo/OFc0rr12L8nWtKqBdLUX07V2mlyo4wrIIBapjo
	5j3SCKfZ95Fb0h5dvdKyVN1H766AvERauM1lvu1HpI6LtLnK+t/Z5G/LjzqDtPULDDH9
	52Kw==
Received: by 10.180.102.9 with SMTP id fk9mr10581312wib.1.1337345767836;
	Fri, 18 May 2012 05:56:07 -0700 (PDT)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id fm1sm824802wib.10.2012.05.18.05.56.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 18 May 2012 05:56:07 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CADZ6=atDkyHJricwLdNqWv9aYNWXUSBVaGhQB1pC9ZTLqNYQtw@mail.gmail.com>
Date: Fri, 18 May 2012 14:55:56 +0200
Message-Id: <C1FD0ECD-98B9-4D93-8351-2A19519FFF2D@dominion.thruhere.net>
References: <CADZ6=avh27wFzfty4h6ntoweX3QrLvkz=8pRgFBp8VQ7YEJ71A@mail.gmail.com>
	<jp5gkp$2ip$1@dough.gmane.org>
	<CADZ6=atDkyHJricwLdNqWv9aYNWXUSBVaGhQB1pC9ZTLqNYQtw@mail.gmail.com>
To: Thilo Fromm <fromm@dresearch-fe.de>
X-Mailer: Apple Mail (2.1278)
X-Gm-Message-State: ALoCoQnkjOPMYPTdD5LN223NHYCchIPm9xIvEj8M4z/DR3gdSrsMyqhA2E5jDha/mqIOFWeOLfxJ
Cc: meta-ti@yoctoproject.org, openembedded-devel@lists.openembedded.org
Subject: Re: [oe] ti81xx-psp-linux-2.6.37: broken kernel with gcc > 4.5
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
X-List-Received-Date: Fri, 18 May 2012 12:56:09 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 18 mei 2012, om 14:53 heeft Thilo Fromm het volgende geschreven:

> Hello Koen,
>=20
>>> sorry for the cross-post (openembedded-devel, meta-ti), I think this
>>> affects both projects one way or the other.
>>>=20
>>> Recently, meta-openembedded/toolchain-layer removed gcc-4.5. This =
means
>>> with oe-core + meta-oe you now can choose between gcc-4.6 and =
gcc-4.7.
>>> However, both compilers break the kernel we're using
>>> (ti81xx-psp-linux-2.6.37).
>>=20
>> What happens when you disable the mailbox? AIUI you shouldn't need =
that on
>> Ne/Ce.
>=20
> How do I disable the mailbox?

In the .config

> What do you mean by Ne/Ce?

Netra/Centaurus, dm81xx, c6a81xx, am38xx, am39xx or whatever TI is =
calling it nowadays.=

