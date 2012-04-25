Return-Path: <sledz@dresearch-fe.de>
Received: from mail-bk0-f48.google.com (mail-bk0-f48.google.com
	[209.85.214.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A515CE0132F
	for <meta-ti@yoctoproject.org>; Wed, 25 Apr 2012 00:49:13 -0700 (PDT)
Received: by bkvi18 with SMTP id i18so1754893bkv.35
	for <meta-ti@yoctoproject.org>; Wed, 25 Apr 2012 00:49:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:x-enigmail-version:content-type
	:content-transfer-encoding:x-gm-message-state;
	bh=fZnvKbPxxLNcerAKpyyMVPXfng/StuTNENjLNhAhplA=;
	b=ZO2/jneVq02GJZsUrUlaIDZcEWEhS7UK6DVGoScZFZuX3cFFCKZ+LC+wIjPAorZoSQ
	4tE5NYl1iJEUbR3UZiGmKNBjUap+RVWD+EmDTg40MYV3KdH26RTPx7CGXCZYXETWTomo
	nlx1t/0tpDYtBmSGyHw6VzSB3SiU6K5DK3FZn0Q4o/5Sa1T6tR/GXTaLvU42/gajThDA
	lGlct/rGtIozmvUHaqPXdli8dR2QFEE9fnWA53lZqXD4stQ/BvcqL1SbMVrZe7BU28sB
	aTmRjgtaEaq/QcOpBdTF4HAdM4QTMDJg1qD3S7AGnqvMTTYi0NTBw6cI/t1SXa2tIq0W
	6djg==
Received: by 10.204.156.141 with SMTP id x13mr496659bkw.50.1335340151776;
	Wed, 25 Apr 2012 00:49:11 -0700 (PDT)
Received: from fensuse.internal.dresearch-fe.de
	(pd95cb174.dip0.t-ipconnect.de. [217.92.177.116])
	by mx.google.com with ESMTPS id
	zx16sm36542340bkb.13.2012.04.25.00.49.10
	(version=SSLv3 cipher=OTHER); Wed, 25 Apr 2012 00:49:10 -0700 (PDT)
Message-ID: <4F97AC74.9070900@dresearch-fe.de>
Date: Wed, 25 Apr 2012 09:49:08 +0200
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120328 Thunderbird/11.0.1
MIME-Version: 1.0
To: Koen Kooi <koen@dominion.thruhere.net>, meta-ti@yoctoproject.org
References: <4F910E4F.9000800@dresearch-fe.de>
	<20120420132050.GA3783@denix.org> <4F9168F4.50306@dresearch-fe.de>
	<4F9794F0.20706@dresearch-fe.de>
	<17B574FF-1E81-4D65-8C70-439CCC24974D@dominion.thruhere.net>
In-Reply-To: <17B574FF-1E81-4D65-8C70-439CCC24974D@dominion.thruhere.net>
X-Enigmail-Version: 1.4.1
X-Gm-Message-State: ALoCoQkjWZxl2f+vGJpckQqwJbjUsr5zPvVdh7qQv++ottLhwp9YOVgx6Ug9qQdrVcqQJggfVzx+
Subject: Re: meta-ti layer confusion
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
X-List-Received-Date: Wed, 25 Apr 2012 07:49:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25.04.2012 08:19, Koen Kooi wrote:
> 
> Op 25 apr. 2012, om 08:08 heeft Steffen Sledz het volgende geschreven:
> 
>> On 20.04.2012 15:47, Steffen Sledz wrote:
>>> On 20.04.2012 15:20, Denys Dmytriyenko wrote:
>>>> On Fri, Apr 20, 2012 at 09:20:47AM +0200, Steffen Sledz wrote:
>>>>> Our company is working on a new TI DM814x based hardware currently.
>>>>>
>>>>> That's a really hard job, because the TI linux support is not really "optimal". But that's not the primary cause for my message.
>>>>>
>>>>> [1] lists two TI BSP layers [2],[3] each one claiming to be "The official OpenEmbedded/Yocto BSP layer for Texas Instruments platforms.".
>>>>>
>>>>> A look into them shows that they are not identically. At the moment they differ in two commits ([3] is ahead of [2]). In the last days these differences where much bigger.
>>>>>
>>>>> So what is the intention for these two "offical" layers?
>>>>>
>>>>> Which one should we use? And why?
>>>>>
>>>>> BTW: Is anyone else out there working on a TI DM814x/DM816x hardware?
>>>>>
>>>>> Regards,
>>>>> Steffen
>>>>>
>>>>> [1] <http://www.openembedded.org/wiki/LayerIndex>
>>>>> [2] <http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/>
>>>>> [3] <https://github.com/Angstrom-distribution/meta-ti>
>>>>
>>>> They are the same. Or more appropriately, there is just one official meta-ti 
>>>> layer, it's just mirrored in several places. The one on yoctoproject.org[2] is 
>>>> considered the official mirror and that's what you should use. If you are 
>>>> subscribed to this list, you should have seen Koen posting 2 patches for 
>>>> review yesterday, which he has staged to his working copy on github[3] - 
>>>> that's the difference in 2 commits. They shouldn't have been pushed to the 
>>>> master branch though, until they are accepted...
>>>
>>> Why are they both listed in [1]?
>>
>> Any objections if i remove [3] from the LayerIndex?
> 
> Yes

Which objections are these?

Why are they both *needed* in the LayerIndex?

>> After your comments i think that this one is just a kind of a staging area.
> 
> And you're thinking wrong

So please explain this to us.

What we've seen in the last days is that there were commits in [3] which were not accepted at that moment. In the moment they got accepted they made their way to [2]. I would call this a staging area.

Regards,
Steffen

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058

