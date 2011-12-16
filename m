Return-Path: <schnitzeltony@gmx.de>
Received: from mailout-de.gmx.net (mailout-de.gmx.net [213.165.64.23])
	by yocto-www.yoctoproject.org (Postfix) with SMTP id 53B94E013E8
	for <meta-ti@yoctoproject.org>; Fri, 16 Dec 2011 01:21:48 -0800 (PST)
Received: (qmail invoked by alias); 16 Dec 2011 09:21:46 -0000
Received: from ip-95-222-156-232.unitymediagroup.de (EHLO
	zera-git-ew.localnet) [95.222.156.232]
	by mail.gmx.net (mp029) with SMTP; 16 Dec 2011 10:21:46 +0100
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX18/Qag7Eak/vSC/yieEz+zTcpLqY2liwYPz6wTgbn
	7cVOrYfG/lGZYi
From: Andreas =?iso-8859-1?q?M=FCller?= <schnitzeltony@gmx.de>
To: meta-ti@yoctoproject.org
Date: Fri, 16 Dec 2011 10:21:49 +0100
User-Agent: KMail/1.13.7 (Linux/2.6.41.4-1.fc15.x86_64; KDE/4.6.5; x86_64; ; )
MIME-Version: 1.0
Message-Id: <201112161021.49738.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: Is it intended to build TI bootloaders with march=armv5?
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
X-List-Received-Date: Fri, 16 Dec 2011 09:21:49 -0000
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi

as some of you might know, I am desperately working on u-boot SPL support for 
gumstix overo and having very strange effects: as soon as a stacic integer 
variable is accessed, the bootloader hangs [1].

In the compile logs I found ( checked also for beagleboard ) that 

march=armv5

is used ( x-load is build with march=armv7-a ). Is this intended? Could this 
explain my trouble?

Andreas

[1] http://lists.denx.de/pipermail/u-boot/2011-December/113491.html



