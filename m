Return-Path: <marek.belisko@gmail.com>
Received: from mail-ie0-f176.google.com (mail-ie0-f176.google.com
	[209.85.223.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B4A85E011AF
	for <meta-ti@yoctoproject.org>; Thu, 15 Nov 2012 12:37:43 -0800 (PST)
Received: by mail-ie0-f176.google.com with SMTP id k11so2966805iea.35
	for <meta-ti@yoctoproject.org>; Thu, 15 Nov 2012 12:37:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=Umu3wyr/0e+n+18kstdVTDdMSs8N230R62zKa9qWZDc=;
	b=QE+72CcCzDmSPhVI5/d2xLlhmhaUysM/vbl9o5GLPC57bCiX5CqhNp05bEZbdzQi6G
	xvakRLEQ1E9MSBsK4ywmVzEnVfnL6mecdthdgTBMSBXBCbE+JATt6pg42NZ1Hs35OO91
	Mypr9nfoCTo5+i8RS40q54O2m9Q2XfIWNdD7QcCophBWkZmWGWWrHqLm3nP30DRjVu4T
	EJfmrk63NucklpUv8hcNX8QZL9/zn3r+Im8yMcxeJdJluBGgvjeiXpCwjDbYdath8Kvf
	vebKp3XsdDX9KUEFn8EuvbKq3nPsLXVtPTxTLj/TGz9/7P1KMwG/wY1x7QLe3n4S4xEo
	j0yA==
MIME-Version: 1.0
Received: by 10.50.190.161 with SMTP id gr1mr1175523igc.14.1353011863381; Thu,
	15 Nov 2012 12:37:43 -0800 (PST)
Received: by 10.64.171.82 with HTTP; Thu, 15 Nov 2012 12:37:43 -0800 (PST)
In-Reply-To: <CAOT3miJQ_VscLkeWfdVXY-kMrn4AL=4wyV3yKyrm9wH0aDVFrw@mail.gmail.com>
References: <CAAfyv35DeRd1qECdKmy9TX2EJ3Xs68C0wGFck-qxD3AH6YYLCw@mail.gmail.com>
	<CAOT3miJQ_VscLkeWfdVXY-kMrn4AL=4wyV3yKyrm9wH0aDVFrw@mail.gmail.com>
Date: Thu, 15 Nov 2012 21:37:43 +0100
Message-ID: <CAAfyv36w+eRju-dA0zd_L9pgLjhaQJjeYjMwMJrXBgC12ajBkg@mail.gmail.com>
From: Belisko Marek <marek.belisko@gmail.com>
To: Nicolas Dechesne <ndec13@gmail.com>
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
X-List-Received-Date: Thu, 15 Nov 2012 20:37:43 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

On Thu, Nov 15, 2012 at 9:36 PM, Nicolas Dechesne <ndec13@gmail.com> wrote:
> On Thu, Nov 15, 2012 at 9:32 PM, Belisko Marek <marek.belisko@gmail.com> wrote:
>> ERROR: Function failed: Fetcher failure for URL:
>> 'git://dev.omapzoom.org/pub/scm/integration/kernel-ubuntu.git;protocol=git;branch=ti-ubuntu-3.4-1487'.
>> Unable to fetch URL from any source.
>> ERROR: Logfile of failure stored in:
>> /home/open-nandra/yocto/poky-danny-8.0/panda_build/tmp/work/pandaboard-poky-linux-gnueabi/linux-omap4-3.4-r0/temp/log.do_fetch.19671
>> ERROR: Task 681
>> (/home/open-nandra/yocto/meta-ti/recipes-kernel/linux/linux-omap4_3.4.bb,
>> do_fetch) failed with exit code '1'
>>
>
> are you behind a corporate firewall?
Nope.
>
> is it reproducible several times? it could be a weakness of our git server...
100% reproducible

Cheers,

marek

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

