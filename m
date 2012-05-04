Return-Path: <s.stirtzel@googlemail.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0C603E0070C
	for <meta-ti@yoctoproject.org>; Fri,  4 May 2012 01:59:00 -0700 (PDT)
Received: by wibhm4 with SMTP id hm4so757421wib.11
	for <meta-ti@yoctoproject.org>; Fri, 04 May 2012 01:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=//qk0OXGi4n5+LQji7woHystC7v00gGBcFAPuRLwFfg=;
	b=ndbyhkDQYqsdtU4Jhs8cHKY0icprpBwQkaUm4x1NFLYvgRYlApBKp3nA5hWoSxQ94Q
	/bL2n4vAR6quxyiT/Lcu1wQW2zPGB7oY2ywAFOJZS6vf1ySnh/Qy3BfVZGYvNzb10knZ
	zF0ylV5dK6J7EwKLPkRqOELIjwLH9vFo5mNzooKHHI/bvRtDsXh4gloEOxuOiRbupI4F
	Dx7u2OKsiEnD0m6s3wr9TfpR9/MZm5Asujje5Jb4my7X7524jzRp7FBIQEOcNMf6GjTx
	cNPOKeiEhItRzF3AxatoXSC5kglql8gkCucqOFWjCc0aoYj26LO78R3xKVbKHFsZq8eJ
	HuWQ==
MIME-Version: 1.0
Received: by 10.216.141.39 with SMTP id f39mr3246567wej.90.1336121940028; Fri,
	04 May 2012 01:59:00 -0700 (PDT)
Received: by 10.223.159.15 with HTTP; Fri, 4 May 2012 01:58:59 -0700 (PDT)
In-Reply-To: <579E347C-A5A3-428D-8D3C-AE971F82FA0E@dominion.thruhere.net>
References: <1335962006-27727-1-git-send-email-koen@dominion.thruhere.net>
	<1335962006-27727-4-git-send-email-koen@dominion.thruhere.net>
	<579E347C-A5A3-428D-8D3C-AE971F82FA0E@dominion.thruhere.net>
Date: Fri, 4 May 2012 10:58:59 +0200
Message-ID: <CAGiJk9doDWSK0WWi910RM2RO5G9Gv4kCcTH-nVwYsWmREh74Lg@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH 4/4] libgles-omap3: work around bug in opkg
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
X-List-Received-Date: Fri, 04 May 2012 08:59:01 -0000
Content-Type: text/plain; charset=UTF-8

2012/5/2 Koen Kooi <koen@dominion.thruhere.net>:
>
> Op 2 mei 2012, om 14:33 heeft Koen Kooi het volgende geschreven:
>
>> All the EGL_BADALLOC failures that user have been reporting turn out to be a bug in opkg: http://groups.google.com/group/opkg-devel/browse_thread/thread/741d18b0ef31435e#
>>
>> Opkg decides to relink symlinks to the wrong files. As a workaround we check the symlink during every bootup and fix it if needed.
>>
>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>
> Patch 3/4 work around this problem as well, but this avoids the potential problem when all packages are installed and you upgrade them. Not sure of that will trigger the bug, but better safe than sorry.
> Stupid thing took 2 months to track down!
>
> regards,
>
> Koen

Hi,
works great!

So it wasn't low priority after all :)


-- 
Regards
Samuel

