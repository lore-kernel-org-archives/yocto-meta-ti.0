Return-Path: <Vladimir_Zapolskiy@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0C845E0027B
	for <meta-ti@yoctoproject.org>; Tue, 31 Jul 2012 13:59:32 -0700 (PDT)
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1SwJXO-0004yr-Uq from Vladimir_Zapolskiy@mentor.com ;
	Tue, 31 Jul 2012 13:59:30 -0700
Received: from SVR-IES-FEM-01.mgc.mentorg.com ([137.202.0.104]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Tue, 31 Jul 2012 13:59:30 -0700
Received: from [172.30.2.207] (137.202.0.76) by SVR-IES-FEM-01.mgc.mentorg.com
	(137.202.0.104) with Microsoft SMTP Server (TLS) id 14.1.289.1;
	Tue, 31 Jul 2012 21:59:28 +0100
Message-ID: <50184725.80703@mentor.com>
Date: Tue, 31 Jul 2012 23:59:17 +0300
From: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:10.0.5) Gecko/20120624 Icedove/10.0.5
MIME-Version: 1.0
To: Denys Dmytriyenko <denys@ti.com>
References: <5007E1FE.3070208@mentor.com> <20120731201625.GC21245@edge>
In-Reply-To: <20120731201625.GC21245@edge>
X-Originating-IP: [137.202.0.76]
X-OriginalArrivalTime: 31 Jul 2012 20:59:30.0802 (UTC)
	FILETIME=[6143C520:01CD6F5F]
Cc: meta-ti@yoctoproject.org
Subject: Re: linux-omap-psp and security code
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
X-List-Received-Date: Tue, 31 Jul 2012 20:59:32 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Denys,

On 31.07.2012 23:16, Denys Dmytriyenko wrote:
> This one got stuck in the moderation queue with all the spam... Just wanted to
> comment on the third option, though.
>
> On Thu, Jul 19, 2012 at 01:31:26PM +0300, Vladimir Zapolskiy wrote:
>> One more option is to fix the patch, either remove store feature of
>> /sys/devices/system/cpu/cpuN/(l2_)?aux_control files or provide
>> -march=armv7-a+sec AFLAGS in Makefile.
>
> FWIW, I previously made a similar fix for this type of issue:
>
> http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/commit/?id=051482e3b03ba7e2d6cecc0d8f85cc3be22dc8b2

Eventually I verified this alternative and found that it won't work
as expected in this particular case. Here assembly instructions are
ingrained in C code, and after compilation there will be ".arch armv7"
directive in the generated assembly sources, which has precedence
over -march assembler flag. So, the only remaining option is to fix C
code.

But asflags method shall work fine with pure assembly sources like
in your fix.

> But either way it's better to update to a more recent 2.6.37 kernel for AM37x
> anyway, which I'll work on next.

Indeed. Excluding two problematic (and IMO useless and potentially
destructive) patches may be a good immediate measure to restore the
builds, but it's up to you to disable them or not. Having support
of the boards in 2.6.37 is the best option for sure.

With best wishes,
Vladimir

