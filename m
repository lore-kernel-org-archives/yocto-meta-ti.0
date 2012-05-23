Return-Path: <sledz@dresearch-fe.de>
Received: from mail-bk0-f48.google.com (mail-bk0-f48.google.com
	[209.85.214.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7646DE01396
	for <meta-ti@yoctoproject.org>; Wed, 23 May 2012 02:48:38 -0700 (PDT)
Received: by bkcjf20 with SMTP id jf20so8548575bkc.35
	for <meta-ti@yoctoproject.org>; Wed, 23 May 2012 02:48:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:x-enigmail-version:content-type
	:content-transfer-encoding:x-gm-message-state;
	bh=Z0EUX6XYrMYe+a2wtLEHoocIdOYzedXJ9+6zNP0x+OU=;
	b=LSJc1bgv5XZ+ryIP7NgwrcK1GxSCasWjX9IuWXJPqj1HhB3D/N++x1HF7yuB/eizw2
	x80Lb2oEL576CHcQpUIZSgQk+A4hOtCJXRgn6c33BzDznLn7Ka+ez4YIUmh8vAWvQrQ1
	h6IKf/TyVlW+WTIGF7YF/SrZOinrzWm/m1gg3CTTvElKIIzZPEe8GJutC8Z5bkGilw0g
	n7gBMwPPQaIQfD/bM4NdIXYcDSyxCaSimIt6uc9WEQEmm6NkCf5mbTBP6uZ6vtED3SPo
	4kPiKRx5CAK0RV9nT/rZyU6lzTtRZE/8jpdmRMqYRTiRz+06Nik+tF23KFjoJWSnwR8m
	hnFg==
Received: by 10.204.128.200 with SMTP id l8mr11503476bks.94.1337766516941;
	Wed, 23 May 2012 02:48:36 -0700 (PDT)
Received: from fensuse.internal.dresearch-fe.de
	(pd95cb174.dip0.t-ipconnect.de. [217.92.177.116])
	by mx.google.com with ESMTPS id 9sm36013831bku.9.2012.05.23.02.48.34
	(version=SSLv3 cipher=OTHER); Wed, 23 May 2012 02:48:35 -0700 (PDT)
Message-ID: <4FBCB272.8050906@dresearch-fe.de>
Date: Wed, 23 May 2012 11:48:34 +0200
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120427 Thunderbird/12.0.1
MIME-Version: 1.0
To: "Monk, Roger" <r-monk@ti.com>
References: <CADZ6=avh27wFzfty4h6ntoweX3QrLvkz=8pRgFBp8VQ7YEJ71A@mail.gmail.com>
	<jp5gkp$2ip$1@dough.gmane.org>
	<CADZ6=atDkyHJricwLdNqWv9aYNWXUSBVaGhQB1pC9ZTLqNYQtw@mail.gmail.com>
	<C1FD0ECD-98B9-4D93-8351-2A19519FFF2D@dominion.thruhere.net>
	<CADZ6=aux412Otdnf_YBJdJB1JUx2bD2sDXy7TNyaefHhq_YxtQ@mail.gmail.com>
	<331B3AEF-9CA7-4639-A316-43DBB4A03E0D@dominion.thruhere.net>
	<4C82F39BABFE6A429733A300DEBF52240B76E4EE@DNCE05.ent.ti.com>
	<CADZ6=avtEDxL1jHTyc218+1Qzf79w0p+YLwPiLOibN6KgC1jsQ@mail.gmail.com>
In-Reply-To: <CADZ6=avtEDxL1jHTyc218+1Qzf79w0p+YLwPiLOibN6KgC1jsQ@mail.gmail.com>
X-Enigmail-Version: 1.4.1
X-Gm-Message-State: ALoCoQkZsJEhVEImxRRik9Iko5jEPPckCDvsAKo1IzC9xsoLuF9cWWcUdnVi23qDuYda0b5pcop+
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Wed, 23 May 2012 09:48:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Roger!

On 18.05.2012 16:55, Thilo Fromm wrote:
>>>>>>>> sorry for the cross-post (openembedded-devel, meta-ti), I think
>>>>>>>> this affects both projects one way or the other.
>>>>>>>>
>>>>>>>> Recently, meta-openembedded/toolchain-layer removed gcc-4.5.
>>>>>>>> This means with oe-core + meta-oe you now can choose between
>>>>>>>> gcc-4.6 and gcc-4.7.
>>>>>>>> However, both compilers break the kernel we're using
>>>>>>>> (ti81xx-psp-linux-2.6.37).
>>>>>>>
>>>> We're on a "TI DaVinci DM8148", featuring a cortex-a8 combined with
>>>> a C674x DSP.
>>>
>>> So a centaurus family SoC.
>>
>> Can you put some printk's in omap_mbox_register (plat-omap/mailbox.c) to print the list objects, in particular the mbox->name?
> 
> What are you trying to do? printk-debugging? Via E-Mail? Are you
> serious? I provided a simple procedure to reproduce the issue. Please
> reproduce and fix the problem.

Ping!

Could you reproduce the bug?

Steffen

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058

