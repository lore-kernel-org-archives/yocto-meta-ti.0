Return-Path: <Sixten.Sjoestroem.Thames@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by yocto-www.yoctoproject.org (Postfix) with SMTP id E03FFE01560
	for <meta-ti@yoctoproject.org>; Wed, 12 Jun 2013 05:33:47 -0700 (PDT)
Received: from SESTOEX05.enea.se ([fe80::41cb:8d2e:2e90:a183]) by
	SESTOEX03.enea.se ([fe80::6ce7:7b51:1edf:e245%17]) with mapi id
	14.02.0318.001; Wed, 12 Jun 2013 14:33:44 +0200
From: =?iso-8859-1?Q?Sixten_Sj=F6str=F6m_Thames?=
	<Sixten.Sjoestroem.Thames@enea.com>
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Thread-Topic: System time issues with Yocto Linux on Keystone 2
Thread-Index: Ac5naOqSbjdyRFLRQV+GcGCMTnCtLA==
Date: Wed, 12 Jun 2013 12:33:43 +0000
Message-ID: <B0B361514883EA47B19C4FC8275640D125B61106@sestoex05.enea.se>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.16.141.145]
MIME-Version: 1.0
Subject: System time issues with Yocto Linux on Keystone 2
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
X-List-Received-Date: Wed, 12 Jun 2013 12:33:50 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

I experience system time issues when I run Yocto Linux on a Keystone 2 targ=
et.

The system time increments to slow.

I get this message from hwclock:
root@keystone-evm:~# hwclock
hwclock: can't open '/dev/misc/rtc': No such file or directory

There is no rtc[x] device visible under /dev

I have been trying to fix this by changing kernel configurations regarding =
RTC and by taking a look at the dts, but without success.

Can someone please point me in the right direction on how to solve this?

I have tried the following kernels:
arago-project.org.git.projects.linux-keystone.git: "DEV.MCSDK-03.08.04.10"
arago-project.org.git.projects.linux-keystone.git: "DEV.MCSDK-03.08.04.11"

Thank you,
Sixten Sj=F6str=F6m Thames

