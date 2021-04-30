Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.530.1619802999337152738
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 30 Apr 2021 10:16:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 508D440C46;
	Fri, 30 Apr 2021 17:16:38 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RXcUvgx5dVL9; Fri, 30 Apr 2021 17:16:38 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 2EBF840C06;
	Fri, 30 Apr 2021 17:16:37 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 88FA71745CE; Fri, 30 Apr 2021 13:16:36 -0400 (EDT)
Date: Fri, 30 Apr 2021 13:16:36 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Alessio Igor Bogani <alessioigorbogani@gmail.com>
Cc: meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti] Fail to build a kernel module
Message-ID: <20210430171636.GZ15937@denix.org>
References: <CAPk1OjHUGA2hje_esMUtM0qWj_NcHeXev-B4oWGYKtD=RWGA2Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAPk1OjHUGA2hje_esMUtM0qWj_NcHeXev-B4oWGYKtD=RWGA2Q@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

# uname -mpi
# make V=1


On Fri, Apr 30, 2021 at 04:56:40PM +0200, Alessio Igor Bogani wrote:
> Hi,
> 
> The image core-image-kernel-dev cannot build a kernel module (*) if it
> was generated using poky and meta-ti (both on dunfell branch) and
> MACHINE=beaglebone . It works instead if the image was generated with
> poky (without meta-ti) using MACHINE=beaglebone-yocto.
> 
> What I have done wrong?
> 
> Thanks!
> 
> Ciao,
> Alessio
> 
> 
> (*)
> root@MiWiFi-R3600-srv:~/a2720-mod# make
> make -C /lib/modules/5.4.106-g023faefa70/build M=/home/root/a2720-mod
> make[1]: Entering directory '/lib/modules/5.4.106-g023faefa70/build'
>   CC [M]  /home/root/a2720-mod/a2720.o
> /tmp/cccIk672.s: Assembler messages:
> /tmp/cccIk672.s:93: Error: selected processor does not support `dsb '
> in ARM mode
> /tmp/cccIk672.s:101: Error: selected processor does not support `dsb
> st' in ARM mode
> /tmp/cccIk672.s:118: Error: selected processor does not support `dsb '
> in ARM mode
> /tmp/cccIk672.s:126: Error: selected processor does not support `dsb
> st' in ARM mode
> /tmp/cccIk672.s:211: Error: selected processor does not support `isb '
> in ARM mode
> /tmp/cccIk672.s:225: Error: selected processor does not support `isb '
> in ARM mode
> /tmp/cccIk672.s:238: Error: selected processor does not support `dsb
> st' in ARM mode
> /tmp/cccIk672.s:253: Error: selected processor does not support `dsb
> st' in ARM mode
> /tmp/cccIk672.s:268: Error: selected processor does not support `dsb
> st' in ARM mode
> /tmp/cccIk672.s:283: Error: selected processor does not support `dsb
> st' in ARM mode
> /tmp/cccIk672.s:298: Error: selected processor does not support `dsb
> st' in ARM mode
> /tmp/cccIk672.s:313: Error: selected processor does not support `dsb
> st' in ARM mode
> /tmp/cccIk672.s:328: Error: selected processor does not support `dsb
> st' in ARM mode
> /tmp/cccIk672.s:343: Error: selected processor does not support `dsb
> st' in ARM mode
> /tmp/cccIk672.s:358: Error: selected processor does not support `dsb
> st' in ARM mode
> /tmp/cccIk672.s:373: Error: selected processor does not support `dsb
> st' in ARM mode
> /tmp/cccIk672.s:389: Error: selected processor does not support `dsb
> st' in ARM mode
> /tmp/cccIk672.s:405: Error: selected processor does not support `dsb
> st' in ARM mode
> /tmp/cccIk672.s:421: Error: selected processor does not support `dsb
> st' in ARM mode
> /tmp/cccIk672.s:437: Error: selected processor does not support `dsb
> st' in ARM mode
> /tmp/cccIk672.s:453: Error: selected processor does not support `dsb
> st' in ARM mode
> /tmp/cccIk672.s:469: Error: selected processor does not support `dsb
> st' in ARM mode
> /tmp/cccIk672.s:484: Error: selected processor does not support `dsb
> st' in ARM mode
> /tmp/cccIk672.s:544: Error: selected processor does not support `dsb '
> in ARM mode
> /tmp/cccIk672.s:555: Error: selected processor does not support `dsb '
> in ARM mode
> /tmp/cccIk672.s:567: Error: selected processor does not support `dsb '
> in ARM mode
> /tmp/cccIk672.s:579: Error: selected processor does not support `dsb '
> in ARM mode
> /tmp/cccIk672.s:591: Error: selected processor does not support `dsb '
> in ARM mode
> /tmp/cccIk672.s:603: Error: selected processor does not support `dsb '
> in ARM mode
> /tmp/cccIk672.s:615: Error: selected processor does not support `dsb '
> in ARM mode
> /tmp/cccIk672.s:627: Error: selected processor does not support `dsb '
> in ARM mode
> /tmp/cccIk672.s:639: Error: selected processor does not support `dsb '
> in ARM mode
> /tmp/cccIk672.s:650: Error: selected processor does not support `dsb '
> in ARM mode
> /tmp/cccIk672.s:661: Error: selected processor does not support `dsb '
> in ARM mode
> /tmp/cccIk672.s:672: Error: selected processor does not support `dsb '
> in ARM mode
> /tmp/cccIk672.s:683: Error: selected processor does not support `dsb '
> in ARM mode
> /tmp/cccIk672.s:694: Error: selected processor does not support `dsb '
> in ARM mode
> /tmp/cccIk672.s:706: Error: selected processor does not support `dsb '
> in ARM mode
> /tmp/cccIk672.s:718: Error: selected processor does not support `dsb '
> in ARM mode
> /tmp/cccIk672.s:730: Error: selected processor does not support `dsb '
> in ARM mode
> /tmp/cccIk672.s:742: Error: selected processor does not support `dsb '
> in ARM mode
> /tmp/cccIk672.s:754: Error: selected processor does not support `dsb '
> in ARM mode
> /tmp/cccIk672.s:785: Error: selected processor does not support `isb '
> in ARM mode
> /tmp/cccIk672.s:799: Error: selected processor does not support `isb '
> in ARM mode
> /tmp/cccIk672.s:823: Error: selected processor does not support `dsb
> st' in ARM mode
> /tmp/cccIk672.s:843: Error: selected processor does not support `dsb
> st' in ARM mode
> /tmp/cccIk672.s:869: Error: selected processor does not support `dsb
> st' in ARM mode
> /tmp/cccIk672.s:888: Error: selected processor does not support `dsb
> st' in ARM mode
> /tmp/cccIk672.s:928: Error: selected processor does not support `isb '
> in ARM mode
> /tmp/cccIk672.s:943: Error: selected processor does not support `isb '
> in ARM mode
> /tmp/cccIk672.s:961: Error: selected processor does not support `dsb
> st' in ARM mode
> /tmp/cccIk672.s:983: Error: selected processor does not support `dsb '
> in ARM mode
> /tmp/cccIk672.s:994: Error: selected processor does not support `dsb '
> in ARM mode
> /tmp/cccIk672.s:1005: Error: selected processor does not support `dsb
> ' in ARM mode
> /tmp/cccIk672.s:1016: Error: selected processor does not support `dsb
> ' in ARM mode
> /tmp/cccIk672.s:1027: Error: selected processor does not support `dsb
> ' in ARM mode
> /tmp/cccIk672.s:1038: Error: selected processor does not support `dsb
> ' in ARM mode
> /tmp/cccIk672.s:1049: Error: selected processor does not support `dsb
> ' in ARM mode
> /tmp/cccIk672.s:1060: Error: selected processor does not support `dsb
> ' in ARM mode
> /tmp/cccIk672.s:1071: Error: selected processor does not support `dsb
> ' in ARM mode
> /tmp/cccIk672.s:1082: Error: selected processor does not support `dsb
> ' in ARM mode
> /tmp/cccIk672.s:1094: Error: selected processor does not support `dsb
> ' in ARM mode
> /tmp/cccIk672.s:1106: Error: selected processor does not support `dsb
> ' in ARM mode
> /tmp/cccIk672.s:1118: Error: selected processor does not support `dsb
> ' in ARM mode
> /tmp/cccIk672.s:1130: Error: selected processor does not support `dsb
> ' in ARM mode
> /tmp/cccIk672.s:1142: Error: selected processor does not support `dsb
> ' in ARM mode
> /tmp/cccIk672.s:1154: Error: selected processor does not support `dsb
> ' in ARM mode
> /tmp/cccIk672.s:1165: Error: selected processor does not support `dsb
> ' in ARM mode
> /tmp/cccIk672.s:1214: Error: selected processor does not support `dsb
> st' in ARM mode
> /tmp/cccIk672.s:1254: Error: selected processor does not support `isb
> ' in ARM mode
> /tmp/cccIk672.s:1269: Error: selected processor does not support `isb
> ' in ARM mode
> /tmp/cccIk672.s:1287: Error: selected processor does not support `dsb
> st' in ARM mode
> /tmp/cccIk672.s:1326: Error: selected processor does not support `isb
> ' in ARM mode
> /tmp/cccIk672.s:1566: Error: selected processor does not support `dsb
> ' in ARM mode
> /tmp/cccIk672.s:1574: Error: selected processor does not support `dsb
> st' in ARM mode
> /tmp/cccIk672.s:1593: Error: selected processor does not support `dsb
> st' in ARM mode
> /tmp/cccIk672.s:1609: Error: selected processor does not support `dsb
> st' in ARM mode
> /tmp/cccIk672.s:1774: Error: selected processor does not support `dsb
> st' in ARM mode
> make[2]: *** [scripts/Makefile.build:262: /home/root/a2720-mod/a2720.o] Error 1
> make[1]: *** [Makefile:1734: /home/root/a2720-mod] Error 2
> make[1]: Leaving directory '/lib/modules/5.4.106-g023faefa70/build'
> make: *** [Makefile:7: all] Error 2
