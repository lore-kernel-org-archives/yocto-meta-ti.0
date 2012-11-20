Return-Path: <marek.belisko@gmail.com>
Received: from mail-ie0-f176.google.com (mail-ie0-f176.google.com
	[209.85.223.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 86AA0E00348
	for <meta-ti@yoctoproject.org>; Tue, 20 Nov 2012 03:21:48 -0800 (PST)
Received: by mail-ie0-f176.google.com with SMTP id 13so2435518iea.35
	for <meta-ti@yoctoproject.org>; Tue, 20 Nov 2012 03:21:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=iukZClT6yVh9f/xDPymZiRBH90q2kwObDvIuzuk+6nA=;
	b=Y9PBwgVBw1LTL5sVkjCfEJt0tKKXrv/s1l+o1/10I55uBiVv486IT3JEg4X81/LUPB
	JeoxR1FJCVX9095i0Gbt4ACzUQlGGFt6ecWG3y09+nNtoeufp82rLIzye1GGpucjXI30
	XSXj7EFvvtuDyYk9SOgFD5a+9lLwpNIM0fLR88flCOH4ykqF4Wcx76fu8fKiBoAd4XOE
	IQNfmIhibu6Df04XNeFmnWtjDdYk6la132r1uBcxnyyKct88y877uEIo/rfjkmo9xlbI
	RTLos6p7RdAJB6abUc2LSVqUmqODUhmfWkcF3kJX3Q40ZWFX5WPyKR/rmtBHGSzrnKUZ
	uEJQ==
MIME-Version: 1.0
Received: by 10.50.152.137 with SMTP id uy9mr9458791igb.62.1353410508061; Tue,
	20 Nov 2012 03:21:48 -0800 (PST)
Received: by 10.64.171.82 with HTTP; Tue, 20 Nov 2012 03:21:47 -0800 (PST)
In-Reply-To: <20121115223921.GA28859@denix.org>
References: <CAAfyv35DeRd1qECdKmy9TX2EJ3Xs68C0wGFck-qxD3AH6YYLCw@mail.gmail.com>
	<CAOT3miJQ_VscLkeWfdVXY-kMrn4AL=4wyV3yKyrm9wH0aDVFrw@mail.gmail.com>
	<CAAfyv36w+eRju-dA0zd_L9pgLjhaQJjeYjMwMJrXBgC12ajBkg@mail.gmail.com>
	<20121115223921.GA28859@denix.org>
Date: Tue, 20 Nov 2012 12:21:47 +0100
Message-ID: <CAAfyv37oJbD-DXOoEFY_PDaSYuGHVXBT8-Ft=b4Em1RvbVhNmA@mail.gmail.com>
From: Belisko Marek <marek.belisko@gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
Cc: meta-ti@yoctoproject.org
Subject: Re: pandaboard fails to fetch 3.4 kernel
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
X-List-Received-Date: Tue, 20 Nov 2012 11:21:48 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Nov 15, 2012 at 11:39 PM, Denys Dmytriyenko <denys@ti.com> wrote:
> On Thu, Nov 15, 2012 at 09:37:43PM +0100, Belisko Marek wrote:
>> Hi,
>>
>> On Thu, Nov 15, 2012 at 9:36 PM, Nicolas Dechesne <ndec13@gmail.com> wrote:
>> > On Thu, Nov 15, 2012 at 9:32 PM, Belisko Marek <marek.belisko@gmail.com> wrote:
>> >> ERROR: Function failed: Fetcher failure for URL:
>> >> 'git://dev.omapzoom.org/pub/scm/integration/kernel-ubuntu.git;protocol=git;branch=ti-ubuntu-3.4-1487'.
>> >> Unable to fetch URL from any source.
>> >> ERROR: Logfile of failure stored in:
>> >> /home/open-nandra/yocto/poky-danny-8.0/panda_build/tmp/work/pandaboard-poky-linux-gnueabi/linux-omap4-3.4-r0/temp/log.do_fetch.19671
>> >> ERROR: Task 681
>> >> (/home/open-nandra/yocto/meta-ti/recipes-kernel/linux/linux-omap4_3.4.bb,
>> >> do_fetch) failed with exit code '1'
>> >>
>> >
>> > are you behind a corporate firewall?
>> Nope.
>> >
>> > is it reproducible several times? it could be a weakness of our git server...
>> 100% reproducible
>
> Can you do it manually:
>
> $ git clone git://dev.omapzoom.org/pub/scm/integration/kernel-ubuntu.git
> Cloning into 'kernel-ubuntu'...
> remote: Counting objects: 2881261, done.
> remote: Compressing objects: 100% (435671/435671), done.
> remote: Total 2881261 (delta 2417385), reused 2880107 (delta 2416231)
> Receiving objects: 100% (2881261/2881261), 691.87 MiB | 1.02 MiB/s, done.
> Resolving deltas: 100% (2417385/2417385), done.
> Checking out files: 100% (33126/33126), done.
Why then it's not working in yocto? Any ideas?
>
> --
> Denys

Marek

-- 
as simple and primitive as possible
-------------------------------------------------
Marek Belisko - OPEN-NANDRA
Freelance Developer

Ruska Nova Ves 219 | Presov, 08005 Slovak Republic
Tel: +421 915 052 184
skype: marekwhite
twitter: #opennandra
web: http://open-nandra.com

