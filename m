Return-Path: <sledz@dresearch-fe.de>
Received: from mail-bk0-f48.google.com (mail-bk0-f48.google.com
	[209.85.214.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B4EABE00746
	for <meta-ti@yoctoproject.org>; Mon, 11 Jun 2012 07:22:37 -0700 (PDT)
Received: by bkcjf20 with SMTP id jf20so4699072bkc.35
	for <meta-ti@yoctoproject.org>; Mon, 11 Jun 2012 07:22:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:x-enigmail-version:content-type
	:content-transfer-encoding:x-gm-message-state;
	bh=aW9wPcz9oyfAT6jbnir9u+POzLxGawbB8lPTqDy7h4A=;
	b=bzIuQ/Sjf9ejyowWP0EkIsllaEW0ozhpEtZWD85omX4CXzFpNkB7uASeLrDr1X0Vwg
	1rTTyoPm+gYxISfdkeaACFH3mjRPUU6dI+Cjb530FFb4WdVI9jG0gQpQsIZEkOu3XuGD
	pAZF20oped1txHnpYOnROiHn673zLwL4I0jQSGfT4d5VSP1qFJ4Nd3lU9RedxDKvW6Wc
	7NP+JYl39u4Dg+2rMMghkxb2Kk3r26jnC6qlaPXqpat+L9Em7XsoATPm2GFKGWxDVvfY
	/XS456udPYu0F/jKNLadWnxrOQW5P3wGhrGc1sfII5Loam3K3BdsSGU0ZyWYXpZ/2DIA
	4CGw==
Received: by 10.204.156.22 with SMTP id u22mr9990687bkw.22.1339424556384;
	Mon, 11 Jun 2012 07:22:36 -0700 (PDT)
Received: from fensuse.internal.dresearch-fe.de (zk223.dresearch-fe.de.
	[217.92.177.116])
	by mx.google.com with ESMTPS id ie3sm16653677bkc.1.2012.06.11.07.22.33
	(version=SSLv3 cipher=OTHER); Mon, 11 Jun 2012 07:22:34 -0700 (PDT)
Message-ID: <4FD5FF28.4030200@dresearch-fe.de>
Date: Mon, 11 Jun 2012 16:22:32 +0200
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
	<4FBCB272.8050906@dresearch-fe.de>
In-Reply-To: <4FBCB272.8050906@dresearch-fe.de>
X-Enigmail-Version: 1.4.2
X-Gm-Message-State: ALoCoQnlsEH/XMmIAar0C76SMc+GOHNXRKxIkZ9cixM8tGs/8Ejq9BKISjYhzmJDybKNz83RtY+s
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
X-List-Received-Date: Mon, 11 Jun 2012 14:22:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23.05.2012 11:48, Steffen Sledz wrote:
> Hi Roger!
> 
> On 18.05.2012 16:55, Thilo Fromm wrote:
>>>>>>>>> sorry for the cross-post (openembedded-devel, meta-ti), I think
>>>>>>>>> this affects both projects one way or the other.
>>>>>>>>>
>>>>>>>>> Recently, meta-openembedded/toolchain-layer removed gcc-4.5.
>>>>>>>>> This means with oe-core + meta-oe you now can choose between
>>>>>>>>> gcc-4.6 and gcc-4.7.
>>>>>>>>> However, both compilers break the kernel we're using
>>>>>>>>> (ti81xx-psp-linux-2.6.37).
>>>>>>>>
>>>>> We're on a "TI DaVinci DM8148", featuring a cortex-a8 combined with
>>>>> a C674x DSP.
>>>>
>>>> So a centaurus family SoC.
>>>
>>> Can you put some printk's in omap_mbox_register (plat-omap/mailbox.c) to print the list objects, in particular the mbox->name?
>>
>> What are you trying to do? printk-debugging? Via E-Mail? Are you
>> serious? I provided a simple procedure to reproduce the issue. Please
>> reproduce and fix the problem.
> 
> Ping!
> 
> Could you reproduce the bug?

FYI

According to [1] we track the progress on this issue at [2].

[1] <https://lists.yoctoproject.org/pipermail/meta-ti/2012-June/001242.html>
[2] <https://github.com/DFE/HidaV/issues/5>

Steffen Sledz

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058

