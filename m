Return-Path: <sledz@dresearch-fe.de>
Received: from mail-bk0-f48.google.com (mail-bk0-f48.google.com
	[209.85.214.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CBDB0E011D1
	for <meta-ti@yoctoproject.org>; Fri, 20 Apr 2012 06:47:37 -0700 (PDT)
Received: by bkcji17 with SMTP id ji17so10870583bkc.35
	for <meta-ti@yoctoproject.org>; Fri, 20 Apr 2012 06:47:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:x-enigmail-version:content-type
	:content-transfer-encoding:x-gm-message-state;
	bh=YyiBpwv6B0OOAlLfmD6V/d0pLXYilzLm9xzlnCxyXPk=;
	b=dP/IHEn3g4UTO2V9UrJFqRzK2FChfyTU5EEdotrfnSE8XMe39Zq+9ggSDYX+OV3rSB
	VUiRPkmdtVSkEqaJMN0nEP8JP0W8ptkh/3d4pDIjkvAs09fBcQiYUILWXAPbhRqga1AL
	AcxjmlpimTUOi4iUZ72r08i4rA+4zAfZH+M5nK2UDJIcUbpLIEGJFeVgD+BwIXbjSYnv
	jHJg1ANDAf5NYKSJb3mmpjj/V1At00QYpq8dUpX5nI3TNPJWNzvn9PypRliz6FsOK7jJ
	aM3mYq+/juCSvu+xQFGKBw+QhjT/c4A1lsf7eL8oPw3N3EXoL/mExfDlIDFV9dyXpPb9
	h/tA==
Received: by 10.204.145.81 with SMTP id c17mr2034048bkv.39.1334929656419;
	Fri, 20 Apr 2012 06:47:36 -0700 (PDT)
Received: from fensuse.internal.dresearch-fe.de
	(pd95cb174.dip0.t-ipconnect.de. [217.92.177.116])
	by mx.google.com with ESMTPS id z17sm10145277bkw.12.2012.04.20.06.47.34
	(version=SSLv3 cipher=OTHER); Fri, 20 Apr 2012 06:47:35 -0700 (PDT)
Message-ID: <4F9168F4.50306@dresearch-fe.de>
Date: Fri, 20 Apr 2012 15:47:32 +0200
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120328 Thunderbird/11.0.1
MIME-Version: 1.0
To: Denys Dmytriyenko <denis@denix.org>, meta-ti@yoctoproject.org
References: <4F910E4F.9000800@dresearch-fe.de>
	<20120420132050.GA3783@denix.org>
In-Reply-To: <20120420132050.GA3783@denix.org>
X-Enigmail-Version: 1.4
X-Gm-Message-State: ALoCoQkFpEfwVO0pBOVvOr9COYCURKUFsfeDYTdG2DWu28z3hxVdrHSnhsh15WuUH2BsRLPs4c4G
Cc: Denys Dmytriyenko <denys@ti.com>
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
X-List-Received-Date: Fri, 20 Apr 2012 13:47:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20.04.2012 15:20, Denys Dmytriyenko wrote:
> On Fri, Apr 20, 2012 at 09:20:47AM +0200, Steffen Sledz wrote:
>> Our company is working on a new TI DM814x based hardware currently.
>>
>> That's a really hard job, because the TI linux support is not really "optimal". But that's not the primary cause for my message.
>>
>> [1] lists two TI BSP layers [2],[3] each one claiming to be "The official OpenEmbedded/Yocto BSP layer for Texas Instruments platforms.".
>>
>> A look into them shows that they are not identically. At the moment they differ in two commits ([3] is ahead of [2]). In the last days these differences where much bigger.
>>
>> So what is the intention for these two "offical" layers?
>>
>> Which one should we use? And why?
>>
>> BTW: Is anyone else out there working on a TI DM814x/DM816x hardware?
>>
>> Regards,
>> Steffen
>>
>> [1] <http://www.openembedded.org/wiki/LayerIndex>
>> [2] <http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/>
>> [3] <https://github.com/Angstrom-distribution/meta-ti>
> 
> They are the same. Or more appropriately, there is just one official meta-ti 
> layer, it's just mirrored in several places. The one on yoctoproject.org[2] is 
> considered the official mirror and that's what you should use. If you are 
> subscribed to this list, you should have seen Koen posting 2 patches for 
> review yesterday, which he has staged to his working copy on github[3] - 
> that's the difference in 2 commits. They shouldn't have been pushed to the 
> master branch though, until they are accepted...

Why are they both listed in [1]?

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058

