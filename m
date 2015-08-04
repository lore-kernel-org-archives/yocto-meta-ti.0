Return-Path: <craig.mcqueen@innerrange.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E2A24E00A49; Mon,  3 Aug 2015 23:47:43 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,RDNS_DYNAMIC
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  1.0 RDNS_DYNAMIC Delivered to internal network by host with
	*      dynamic-looking rDNS
X-Greylist: delayed 63 seconds by postgrey-1.32 at yocto-www;
	Mon, 03 Aug 2015 23:47:41 PDT
Received: from remote.innerrange.com (122-143-146.dsl.connexus.net.au
	[203.122.143.146])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 225C4E00A28
	for <meta-ti@yoctoproject.org>; Mon,  3 Aug 2015 23:47:41 -0700 (PDT)
Received: from IR-CENTRAL.corp.innerrange.com ([fe80::216f:2d6c:20cc:241b]) by
	IR-CENTRAL.corp.innerrange.com ([fe80::216f:2d6c:20cc:241b%16]) with
	mapi; Tue, 4 Aug 2015 16:46:34 +1000
From: Craig McQueen <craig.mcqueen@innerrange.com>
To: Denys Dmytriyenko <denys@ti.com>
Date: Tue, 4 Aug 2015 16:46:33 +1000
Thread-Topic: [meta-ti] Error when recompiling linux-ti-staging kernel
Thread-Index: AdCESc0rXC0rbwmMTp+cBVa6iYpfUgCelqGAEe3KfnA=
Message-ID: <5500469A22567C4BAF673A6E86AFA3A40227C1D64168@IR-CENTRAL.corp.innerrange.com>
References: <5500469A22567C4BAF673A6E86AFA3A402227F4FAA84@IR-CENTRAL.corp.innerrange.com>
	<20150501200241.GE29290@edge>
	<5500469A22567C4BAF673A6E86AFA3A402227F4FAEA7@IR-CENTRAL.corp.innerrange.com>
In-Reply-To: <5500469A22567C4BAF673A6E86AFA3A402227F4FAEA7@IR-CENTRAL.corp.innerrange.com>
Accept-Language: en-US, en-AU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US, en-AU
x-tm-as-product-ver: SMEX-11.1.0.1239-8.000.1202-21720.006
x-tm-as-result: No--51.025300-5.000000-31
x-tm-as-user-approved-sender: No
x-tm-as-user-blocked-sender: No
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: Error when recompiling linux-ti-staging kernel
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
X-List-Received-Date: Tue, 04 Aug 2015 06:47:44 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> bounces@yoctoproject.org] On Behalf Of Craig McQueen
> Sent: Tuesday, 5 May 2015 10:17 AM
> To: Denys Dmytriyenko <denys@ti.com>
> Cc: meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] Error when recompiling linux-ti-staging kernel
>=20
> > -----Original Message-----
> > From: Denys Dmytriyenko [mailto:denys@ti.com]
> > Sent: Saturday, 2 May 2015 6:03 AM
> > To: Craig McQueen
> > Cc: meta-ti@yoctoproject.org
> > Subject: Re: [meta-ti] Error when recompiling linux-ti-staging kernel
> >
> > On Thu, Apr 30, 2015 at 10:50:12AM +1000, Craig McQueen wrote:
> > > I'm using meta-ti with Poky dizzy to build linux-ti-staging 3.14.x
> > > for a BeagleBone Black based system.
> > >
> > > When I do a rebuild of linux-ti-staging, it does most of the compile
> > > but then fails with an error:
> > >
> > > | touch: cannot touch
> > > | '/home/craigm/yocto/poky/<boardname>/tmp/work/<boardname>-
> > poky-linux
> > > | -gnueabi/linux-ti-staging/3.14.39-r22b+gitrAUTOINC+ba552b4bc7/imag
> > > | e/
> > > | lib/modules/3.14.39/build': Permission denied
> > > | WARNING: exit code 1 from a shell command.
> > > | ERROR: Function failed: do_compileconfigs (log file is located at
> > > | /home/craigm/yocto/poky/<boardname>/tmp/work/<boardname>-
> > poky-linux-
> > > | gnueabi/linux-ti-staging/3.14.39-r22b+gitrAUTOINC+ba552b4bc7/temp/
> > > | lo
> > > | g.do_compileconfigs.4657)
> > >
> > > Checking that file, I find that it's a symlink that points to
> > > /usr/src/kernel, which doesn't exist.
> > >
> > > My current work-around is to do "bitbake linux-ti-staging -c clean"
> > > then rebuild my image. It works fine as long as it's a fresh build.
> > > But that slows down the development cycle.
> > >
> > > Why might this be happening?
> >
> > Hmm, interesting. Which branch of meta-ti do you use for dizzy?
>=20
> I've been using meta-ti master branch. I don't think meta-ti even has a d=
izzy
> branch (although it does have a daisy branch).

This seems to be due to the following line in multi-kernel.inc:

    touch "${D}/lib/modules/${KERNEL_VERSION}/build"

I'm not sure what purpose it's intended to serve, but it's problematic. (I =
can see it's being used to build a "systest" kernel, although why it's doin=
g that, I'm not yet sure.)

--=20
Craig McQueen


