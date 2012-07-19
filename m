Return-Path: <Vladimir_Zapolskiy@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4E1F6E0070B
	for <meta-ti@yoctoproject.org>; Thu, 19 Jul 2012 03:31:35 -0700 (PDT)
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1Sro18-00040D-NC from Vladimir_Zapolskiy@mentor.com ;
	Thu, 19 Jul 2012 03:31:34 -0700
Received: from SVR-IES-FEM-01.mgc.mentorg.com ([137.202.0.104]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Thu, 19 Jul 2012 03:31:34 -0700
Received: from [172.30.2.241] (137.202.0.76) by SVR-IES-FEM-01.mgc.mentorg.com
	(137.202.0.104) with Microsoft SMTP Server (TLS) id 14.1.289.1;
	Thu, 19 Jul 2012 11:31:32 +0100
Message-ID: <5007E1FE.3070208@mentor.com>
Date: Thu, 19 Jul 2012 13:31:26 +0300
From: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:10.0.5) Gecko/20120624 Icedove/10.0.5
MIME-Version: 1.0
To: <meta-ti@yoctoproject.org>
X-Originating-IP: [137.202.0.76]
X-OriginalArrivalTime: 19 Jul 2012 10:31:34.0414 (UTC)
	FILETIME=[AB6E32E0:01CD6599]
X-Mailman-Approved-At: Tue, 31 Jul 2012 12:58:15 -0700
Subject: linux-omap-psp and security code
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
X-List-Received-Date: Thu, 19 Jul 2012 10:31:35 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

I have a question about linux-omap-psp-2.6.32 kernel and boards, which 
uses this kernel, in particular about 
0038-ARM-Expose-some-CPU-control-registers-via-sysfs.patch. The recent 
toolchains based on binutils-2.21 or later imply more accurate handling 
with `smc #0' instructions, which are found in the aforementioned patch. 
The compilation of the linux-omap-psp kernel with such toolchains leads 
to "selected processor does not support ARM mode `smc #0'" errors. The 
patch itself adds /sys/devices/system/cpu/cpuN/ nodes providing access 
to control register, auxiliary control register, and L2 cache auxiliary 
control register.

I see several possible solutions of the problem, and I'd be glad to find 
out the best one. First of all it might have sense to remove the patch 
completely, because its functionality is purely optional, presumably it 
is not used by any userspace programs and therefore can be omitted. As a 
soft alternative CONFIG_CPU_V7_SYSFS kernel option for a list of boards 
could be disabled in default kernel config files, but I personally don't 
like this variant, because it merely veils a problem, better to remove 
the patch itself.

One more option is to fix the patch, either remove store feature of 
/sys/devices/system/cpu/cpuN/(l2_)?aux_control files or provide 
-march=armv7-a+sec AFLAGS in Makefile.

Any suggestions and comments are appreciated.

With best wishes,
Vladimir

