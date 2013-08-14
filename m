Return-Path: <chgans@googlemail.com>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B334FE00747
	for <meta-ti@yoctoproject.org>; Wed, 14 Aug 2013 01:28:27 -0700 (PDT)
Received: by mail-pa0-f43.google.com with SMTP id hz10so9849843pad.16
	for <meta-ti@yoctoproject.org>; Wed, 14 Aug 2013 01:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=PrWnpq+y50/ONpXYYoMetCVeu+/ObNQlfwUd/P07aY0=;
	b=tbIKNuSpGck7inadawbJdgG/yWjqkKLvMX0V7AsivlG/dN+tavZz5RbutrqdkKcT5M
	6pqz2MD87St3VhrNaxhhxqOH3e5eA1sQh0uEFVVm8nbxkZpW7WR20gF16J8JDDiZCoVb
	/GSBwZpLxexug2eE5H6htCeFmus1T0wTuKtkxGLzAs4DjU0F6M4BSexhghQOYXmH5lyU
	CDqTsc0yMquGO8TsLQUooPNo/kWtjwhyR5rVWEQ8hc1Q4eshdgHdG5RtHXqcibDNil1J
	FMxaOmXoXQbvXIOkqcthiGNrljZapwqwV+FZmfS41y8M4fY+91FC0LYtenobliar/H6H
	a3wQ==
X-Received: by 10.66.246.106 with SMTP id xv10mr8733005pac.100.1376468907181; 
	Wed, 14 Aug 2013 01:28:27 -0700 (PDT)
Received: from linux-z8sp.site ([121.99.34.39])
	by mx.google.com with ESMTPSA id ia5sm8116847pbc.42.2013.08.14.01.28.24
	for <meta-ti@yoctoproject.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 14 Aug 2013 01:28:26 -0700 (PDT)
Sender: Chris Gagneraud <chgans@googlemail.com>
Message-ID: <520BE875.8030005@gna.org>
Date: Thu, 15 Aug 2013 08:28:37 +1200
From: Christian Gagneraud <chgans@gna.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130620 Thunderbird/17.0.7
MIME-Version: 1.0
To: meta-ti@yoctoproject.org
References: <2BC3ECFBDE78594E858F96993713F3F9011FA5E2@IGTEMUMMB11.igatecorp.com>
	<20130811182754.GA28453@edge>
In-Reply-To: <20130811182754.GA28453@edge>
Subject: Re: unable to fetch a repository mentioned in SRC_URI
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
X-List-Received-Date: Wed, 14 Aug 2013 08:28:29 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

On 08/12/2013 06:27 AM, Denys Dmytriyenko wrote:
> On Tue, Aug 06, 2013 at 11:43:08AM +0000, Prathamesh P Ghanekar wrote:
>> Hello,
>>
>> I am trying to integrate meta-ti layer into the current yocto project. I
>> wish to build the image for pandaboard.
>>
>> I am adding another layer called meta-ivi in the yocto kernel which provided
>> functionality for in-vehicle infotainment systems. In the meta-ivi layer,
>> there is a recipe "foton-image", which builds GENIVI compliant baseline
>> image. Also, few recipes were masked to resolve the license issue.
>>
>> So, setting all the variables in the conf/local.conf and conf/bblayers.conf
>> file, I build the image as follows.
>>
>>
>> è bitbake foton-image
>>
>>
>> I ended up with following error, which indicates that there's a failure in fetching the repository.
>>
>> Here is the output log for your reference:
>>
>> prathamesh@mintos ~/workdir/poky-dylan-9.0.1/build $ bitbake foton-image
>> Loading cache: 100% |###################################################################################################################################| ETA:  00:00:00
>> Loaded 1220 entries from dependency cache.
>>
>> Build Configuration:
>> BB_VERSION        = "1.18.0"
>> BUILD_SYS         = "i686-linux"
>> NATIVELSBSTRING   = "LinuxMint-14"
>> TARGET_SYS        = "arm-oe-linux-gnueabi"
>> MACHINE           = "pandaboard"
>> DISTRO            = "poky-ivi-systemd"
>> DISTRO_VERSION    = "4.0.2"
>> TUNE_FEATURES     = "armv7a vfp neon"
>> TARGET_FPU        = "vfp-neon"
>> meta
>> meta-yocto
>> meta-yocto-bsp
>> meta-ivi-4.0.2    = "<unknown>:<unknown>"
>> meta-ti           = "master:c14c386946e1ea341faeea292580e37d538d645d"
>>
>> NOTE: Resolving any missing task queue dependencies
>> NOTE: multiple providers are available for u-boot (u-boot, u-boot-ti-staging)
>> NOTE: consider defining a PREFERRED_PROVIDER entry to match u-boot
>> NOTE: Preparing runqueue
>> NOTE: Executing SetScene Tasks
>> NOTE: Executing RunQueue Tasks
>> WARNING: Failed to fetch URL git://dev.omapzoom.org/pub/scm/integration/kernel-ubuntu.git;protocol=git;branch=ti-ubuntu-3.4-1487<http://dev.omapzoom.org/pub/scm/integration/kernel-ubuntu.git;protocol=git;branch=ti-ubuntu-3.4-1487>, attempting MIRRORS if available
>> ERROR: Fetcher failure: Fetch command failed with exit code 128, output:
>> Cloning into bare repository '/home/prathamesh/workdir/poky-dylan-9.0.1/build/downloads/git2/dev.omapzoom.org.pub.scm.integration.kernel-ubuntu.git'...
>>
>> fatal: The remote end hung up unexpectedly
>> fatal: early EOF
>> fatal: index-pack failed
> It seems you had your connection terminated unexpectedly... Have you tried it
> again? Does it happen every time?
> BTW, seems to work fine here...

I ran into similar problems recently (strange git failure), but as I 
didn't have strong need to build new stuff, I simply gave up straight 
away and switched to another task.
The only "odd" thing I have here, is a *@#$! proxy. I am located in New 
Zealand.

Chris

>
>
>> ERROR: Function failed: Fetcher failure for URL: 'git://dev.omapzoom.org/pub/scm/integration/kernel-ubuntu.git;protocol=git;branch=ti-ubuntu-3.4-1487<http://dev.omapzoom.org/pub/scm/integration/kernel-ubuntu.git;protocol=git;branch=ti-ubuntu-3.4-1487>'. Unable to fetch URL from any source.
>> ERROR: Logfile of failure stored in: /home/prathamesh/workdir/poky-dylan-9.0.1/build/tmp-eglibc-eglibc/work/pandaboard-oe-linux-gnueabi/linux-omap4/3.4-r0/temp/log.do_fetch.4257
>> ERROR: Task 910 (/home/prathamesh/workdir/meta-ti/recipes-kernel/linux/linux-omap4_3.4.bb<http://linux-omap4_3.4.bb>, do_fetch) failed with exit code '1'
>> NOTE: Tasks Summary: Attempted 2323 tasks of which 2231 didn't need to be rerun and 1 failed.
>> Waiting for 0 running tasks to finish:
>>
>> Summary: 1 task failed:
>>    /home/prathamesh/workdir/meta-ti/recipes-kernel/linux/linux-omap4_3.4.bb<http://linux-omap4_3.4.bb>, do_fetch
>> Summary: There was 1 WARNING message shown.
>> Summary: There were 2 ERROR messages shown, returning a non-zero exit code.
>>
>> Note:
>> 1. I have successfully built the foton-image for target vexpressa9, and it
>> boots without any errors in the qemu emulator.
>> 2. I am able to 'git clone' the above mentioned repository. If you could let
>> me know how can I use the local repository for build process. I tried
>> copying the repository in downloads folder, but it did not work somehow.
> You need to get a bare repository and place it into:
> downloads/git2/dev.omapzoom.org.pub.scm.integration.kernel-ubuntu.git
>


