Return-Path: <Jose.Alarcon@procemex.com>
Received: from exchange.procemex.com (edgerole.procemex.fi [89.236.108.139])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 84830E006B5
	for <meta-ti@yoctoproject.org>; Fri,  7 Feb 2014 02:36:26 -0800 (PST)
Received: from EXCHANGE.hq.procemex.fi (192.168.123.254) by
	edgerole.procemex.fi (192.168.123.253) with Microsoft SMTP Server (TLS)
	id 14.0.722.0; Fri, 7 Feb 2014 12:37:00 +0200
Received: from EXCHANGE.hq.procemex.fi ([192.168.123.254]) by
	exchange.hq.procemex.fi ([192.168.123.254]) with mapi; Fri, 7 Feb 2014
	12:36:10 +0200
From: Jose Alarcon <Jose.Alarcon@procemex.com>
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Thread-Topic: TI boot-monitor recipe doesn't install the boot monitor binary
	in the image
Thread-Index: Ac8j8GoYh5uIB+eoR/C6bj4vKQfRyw==
Date: Fri, 7 Feb 2014 10:36:09 +0000
Message-ID: <DD2F89422B483148BCFD0BF72A6C148A78C815A2@exchange.hq.procemex.fi>
Accept-Language: en-US, fi-FI
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Subject: TI boot-monitor recipe doesn't install the boot monitor binary in the image
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
X-List-Received-Date: Fri, 07 Feb 2014 10:36:37 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi there,

In order to boot ubi images on our Keystone2-evem, we had to modify the boo=
t-monitor recipe so that the boot monitor binary gets installed into the im=
age.

We fixed this in our own layers with a bbappend file like this:

    PROVIDES +=3D "boot-monitor"

    do_install () {
        install -d ${D}/boot
        install ${S}/${BOOT_MONITOR_BINARY} ${D}/boot/${BOOT_MONITOR_IMAGE}
        ln -sf ${BOOT_MONITOR_IMAGE} ${D}/boot/${BOOT_MONITOR_BINARY}
    }

    FILES_${PN} =3D "/boot ${sysconfdir}"

Should this be fixed in the boot-monitor_git.bb recipe itself?

I am using danny branch of meta-ti, commit 0039248515b16b88161844aef5d50773=
7331c834

Best,

--
Jose Alarcon=

