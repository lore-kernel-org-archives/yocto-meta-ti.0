Return-Path: <prvs=3631c82196=christian.schulenberg@bmw.de>
Received: from mxout38.expurgate.net (mxout38.expurgate.net [194.37.255.38])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 21F92E00717
	for <meta-ti@yoctoproject.org>; Thu, 27 Sep 2012 06:47:50 -0700 (PDT)
Received: from [127.0.0.1] (helo=localhost)
	by relay.expurgate.net with smtp (Exim 4.77)
	(envelope-from <prvs=3631c82196=christian.schulenberg@bmw.de>)
	id 1THERQ-00034T-OG; Thu, 27 Sep 2012 15:47:48 +0200
Received: from [160.46.252.44] (helo=cmtamx3b.bmwgroup.com)
	by relay.expurgate.net with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.77) (envelope-from <Christian.Schulenberg@bmw.de>)
	id 1THERP-00033r-L9; Thu, 27 Sep 2012 15:47:47 +0200
Received: from cmtabb2a.muc (cmtabb2a.muc [160.50.100.13])
	by cmtamx3a.bmwgroup.com (8.13.8/8.13.8) with ESMTP id q8RDle96005417
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Thu, 27 Sep 2012 15:47:40 +0200
Received: from SMUCH01A.europe.bmw.corp (smuch01a.muc [160.50.20.68])
	by cmtabb2a.muc (8.13.8/8.13.8) with ESMTP id q8RDldjR032323;
	Thu, 27 Sep 2012 15:47:39 +0200
Received: from SMUCM08V.europe.bmw.corp ([160.50.20.51]) by
	SMUCH01A.europe.bmw.corp ([160.50.20.68]) with mapi; Thu, 27 Sep 2012
	15:47:39 +0200
From: <Christian.Schulenberg@bmw.de>
To: <ebutera@users.sourceforge.net>
Date: Thu, 27 Sep 2012 15:47:38 +0200
Thread-Topic: [meta-ti] pandaboard not booting
Thread-Index: Ac2cqJIyAQqQ4yAFTiODRoopnwtGqwADfeVQ
Message-ID: <EF446FF9DAC93B479C74AB9153DE173F1117CBFB@SMUCM08V.europe.bmw.corp>
References: <5061B4F0.3080505@intel.com>	<5062B681.20407@intel.com>
	<CA+2YH7vDWica3F3ORcNJti_3CALGeBNyXFqBZP-nhcDE5Ueokg@mail.gmail.com>
	<5062DC98.20106@intel.com>	<5062DDB7.60308@mlbassoc.com>
	<5062F839.302@intel.com>	<5062FB00.7080307@mlbassoc.com>
	<506307F1.6030303@intel.com>
	<EF446FF9DAC93B479C74AB9153DE173F111237C8@SMUCM08V.europe.bmw.corp>
	<CA+2YH7uT8AcfDw3Ed0CzTXOH7qd_9MO4uYi8QXKxVmYpMJnzTQ@mail.gmail.com>
	<EF446FF9DAC93B479C74AB9153DE173F1117CA4D@SMUCM08V.europe.bmw.corp>
	<CA+2YH7vSDK0CS6Yh1pu26qygOhiKZycA0or7EXtF-Z09ntQvjw@mail.gmail.com>
In-Reply-To: <CA+2YH7vSDK0CS6Yh1pu26qygOhiKZycA0or7EXtF-Z09ntQvjw@mail.gmail.com>
Accept-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: de-DE
MIME-Version: 1.0
X-Spam-Status: No, No
X-purgate-relay-fid: relay-5443cb
X-purgate-sourceid: 1THERP-00033r-L9
X-purgate-Ad: Checked for spam and viruses by eXpurgate(R),
	see www.eleven.de for details.
X-purgate-ID: 151534::1348753668-00005CD1-F2E11E3A/0-0/0-0
X-purgate: clean
X-purgate-type: clean
X-purgate-relay-bid: relay-5443cb
Cc: meta-ti@yoctoproject.org
Subject: Re: pandaboard not booting
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
X-List-Received-Date: Thu, 27 Sep 2012 13:47:50 -0000
Content-Language: de-DE
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

as I wrote before, I have an older version. I used the kernel version of th=
at one to start up my new meta-ivi build. It crashed later with a kernel pa=
nic, but at least the kernel is running.

After that I compared the two kernel version I have, with mkimage -l.

1. Kernel version that is working quite well:

mkimage -l uImage
Image Name:   Linux-3.1.0
Created:      Fri Sep 21 11:25:32 2012
Image Type:   ARM Linux Kernel Image (uncompressed)
Data Size:    4144744 Bytes =3D 4047.60 kB =3D 3.95 MB
Load Address: 80008000
Entry Point:  80008000

2. Kernel version that fails after uncompression:

mkimage -l uImage
Image Name:   Linux-3.1.0
Created:      Thu Sep 27 07:07:25 2012
Image Type:   ARM Linux Kernel Image (uncompressed)
Data Size:    4176432 Bytes =3D 4078.55 kB =3D 3.98 MB
Load Address: 80008000
Entry Point:  80008000

I don't see any major issues here, so I guess I need to check the toolchain=
 as proposed by Enrico.

Christian

-----Urspr=FCngliche Nachricht-----
Von: ebutera@gmail.com [mailto:ebutera@gmail.com] Im Auftrag von Enrico
Gesendet: Donnerstag, 27. September 2012 14:07
An: Schulenberg Christian, EI-42
Cc: meta-ti@yoctoproject.org
Betreff: Re: [meta-ti] pandaboard not booting

On Thu, Sep 27, 2012 at 1:16 PM,  <Christian.Schulenberg@bmw.de> wrote:
> I'm using the same kernel version as I did before. It's the default kerne=
l 3.1 as configured in the meta-ti layer: ti-ubuntu-3.1.0-1282.11, Revision=
: a5c60c099296fcfc0c8fa8085c40883971486512
>
> Do you really think it makes sense to switch to a more recent one?

No, but i have no better ideas right now...

You could check if it's a known toolchain bug with that kernel, but i
think it would be faster to try a newer kernel (from the same
repository, ti ubuntu integration).

Enrico

