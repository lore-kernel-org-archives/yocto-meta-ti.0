Return-Path: <craig.mcqueen@innerrange.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CA7ABE009A5; Tue, 28 Apr 2015 23:07:58 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,RDNS_DYNAMIC
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  1.0 RDNS_DYNAMIC Delivered to internal network by host with
	*      dynamic-looking rDNS
Received: from remote.innerrange.com (122-143-146.dsl.connexus.net.au
	[203.122.143.146])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BB8DCE00932
	for <meta-ti@yoctoproject.org>; Tue, 28 Apr 2015 23:07:55 -0700 (PDT)
Received: from IR-CENTRAL.corp.innerrange.com ([fe80::758b:a6c:a61b:18f4]) by
	IR-CENTRAL.corp.innerrange.com ([fe80::758b:a6c:a61b:18f4%14]) with
	mapi; Wed, 29 Apr 2015 16:07:53 +1000
From: Craig McQueen <craig.mcqueen@innerrange.com>
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Date: Wed, 29 Apr 2015 16:07:51 +1000
Thread-Topic: Deploying linux-ti-staging initramfs kernel into /boot
Thread-Index: AdCCQtNSrVw3hnSzRRS6gVz1kLvY8w==
Message-ID: <5500469A22567C4BAF673A6E86AFA3A402227F4FA9C6@IR-CENTRAL.corp.innerrange.com>
Accept-Language: en-US, en-AU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US, en-AU
x-tm-as-product-ver: SMEX-11.1.0.1239-7.500.1018-21510.005
x-tm-as-result: No--40.600400-5.000000-31
x-tm-as-user-approved-sender: No
x-tm-as-user-blocked-sender: No
MIME-Version: 1.0
Subject: Deploying linux-ti-staging initramfs kernel into /boot
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
X-List-Received-Date: Wed, 29 Apr 2015 06:07:58 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I'm using linux-ti-staging kernel 3.14.x with Yocto dizzy, for a build for =
BeagleBone Black based system.

I'd like to use initramfs in my kernel. So I've set INITRAMFS_IMAGE in my l=
inux-ti-staging_3.14.bbappend, and INITRAMFS_IMAGE_BUNDLE =3D "1" in local.=
conf. Now in build dir tmp/deploy/images/<boardname> I'm getting zImage-ini=
tramfs-<boardname>.bin being built fine.

However, I'm not getting an initramfs image being deployed to /boot, but ju=
st a plain zImage without an initramfs.

Looking in the build directory tmp/work/<boardname>-poky-linux-gnueabi/linu=
x-ti-staging/3.14.39-r22b+gitrAUTOINC+ba552b4bc7/packages-split/kernel-imag=
e/boot I see there is:

zImage-3.14.39
zImage-initramfs-<boardname>.bin

--however the zImage-initramfs-<boardname>.bin file isn't being included in=
 deploy-rpms/<boardname>/kernel-image-3.14.39-3.14.39-r22b+gitrAUTOINC+ba55=
2b4bc7.<boardname>.rpm for some reason.

But, if I change my linux-ti-staging_3.14.bbappend to include any one of th=
e following lines, then the kernel-image .rpm file _does_ include both zIma=
ge files:

RDEPENDS_kernel-base =3D ""
RDEPENDS_kernel-base =3D "kernel-devicetree"
RDEPENDS_kernel-base =3D "kernel-image"

But if I put:

RDEPENDS_kernel-base =3D "kernel-image kernel-devicetree"

--then there is no zImage-initramfs-<boardname>.bin in the kernel-image .rp=
m. This seems very confusing.

Why would zImage-initramfs-<boardname>.bin disappear from the kernel-image =
package when the linux-ti-staging RDEPENDS_kernel-base specifies both kerne=
l-image and kernel-devicetree, but not other cases?

--=20
Craig McQueen


