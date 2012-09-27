Return-Path: <prvs=3631c82196=christian.schulenberg@bmw.de>
Received: from mxout38.expurgate.net (mxout38.expurgate.net [194.37.255.38])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8C66DE004AB
	for <meta-ti@yoctoproject.org>; Thu, 27 Sep 2012 04:17:54 -0700 (PDT)
Received: from [127.0.0.1] (helo=localhost)
	by relay.expurgate.net with smtp (Exim 4.77)
	(envelope-from <prvs=3631c82196=christian.schulenberg@bmw.de>)
	id 1THC6F-0004DT-64; Thu, 27 Sep 2012 13:17:47 +0200
Received: from [160.46.252.50] (helo=cmtamx4b.bmwgroup.com)
	by relay.expurgate.net with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.77) (envelope-from <Christian.Schulenberg@bmw.de>)
	id 1THC6B-0006TV-KZ; Thu, 27 Sep 2012 13:17:44 +0200
Received: from cmtabb3a.muc (cmtabb3a.muc [160.50.100.15])
	by cmtamx4a.bmwgroup.com (8.13.8/8.13.8) with ESMTP id q8RBHCjB006850
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Thu, 27 Sep 2012 13:17:23 +0200
Received: from SMUCH06B.europe.bmw.corp (smuch06b.muc [160.50.20.56])
	by cmtabb3a.muc (8.13.8/8.13.8) with ESMTP id q8RBGvJr029450;
	Thu, 27 Sep 2012 13:16:57 +0200
Received: from SMUCM08V.europe.bmw.corp ([160.50.20.51]) by
	SMUCH06B.europe.bmw.corp ([160.50.20.56]) with mapi; Thu, 27 Sep 2012
	13:16:57 +0200
From: <Christian.Schulenberg@bmw.de>
To: <ebutera@users.sourceforge.net>
Date: Thu, 27 Sep 2012 13:16:56 +0200
Thread-Topic: [meta-ti] pandaboard not booting
Thread-Index: Ac2cjNGvQYqIgr87QIi40uve0lAO1gAFFcHQ
Message-ID: <EF446FF9DAC93B479C74AB9153DE173F1117CA4D@SMUCM08V.europe.bmw.corp>
References: <5061B4F0.3080505@intel.com>	<5062B681.20407@intel.com>
	<CA+2YH7vDWica3F3ORcNJti_3CALGeBNyXFqBZP-nhcDE5Ueokg@mail.gmail.com>
	<5062DC98.20106@intel.com>	<5062DDB7.60308@mlbassoc.com>
	<5062F839.302@intel.com>	<5062FB00.7080307@mlbassoc.com>
	<506307F1.6030303@intel.com>
	<EF446FF9DAC93B479C74AB9153DE173F111237C8@SMUCM08V.europe.bmw.corp>
	<CA+2YH7uT8AcfDw3Ed0CzTXOH7qd_9MO4uYi8QXKxVmYpMJnzTQ@mail.gmail.com>
In-Reply-To: <CA+2YH7uT8AcfDw3Ed0CzTXOH7qd_9MO4uYi8QXKxVmYpMJnzTQ@mail.gmail.com>
Accept-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: de-DE
MIME-Version: 1.0
X-Spam-Status: No, No
X-purgate-relay-fid: relay-1fca43
X-purgate-sourceid: 1THC6B-0006TV-KZ
X-purgate-Ad: Checked for spam and viruses by eXpurgate(R),
	see www.eleven.de for details.
X-purgate-ID: 151534::1348744666-00002241-754E2F8E/0-0/0-0
X-purgate: clean
X-purgate-type: clean
X-purgate-relay-bid: relay-2ebacf
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
X-List-Received-Date: Thu, 27 Sep 2012 11:17:54 -0000
Content-Language: de-DE
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

I'm using the same kernel version as I did before. It's the default kernel =
3.1 as configured in the meta-ti layer: ti-ubuntu-3.1.0-1282.11, Revision: =
a5c60c099296fcfc0c8fa8085c40883971486512

Do you really think it makes sense to switch to a more recent one?




-----Urspr=FCngliche Nachricht-----
Von: ebutera@gmail.com [mailto:ebutera@gmail.com] Im Auftrag von Enrico
Gesendet: Donnerstag, 27. September 2012 10:48
An: Schulenberg Christian, EI-42
Cc: radu.moisan@intel.com; meta-ti@yoctoproject.org
Betreff: Re: [meta-ti] pandaboard not booting

On Thu, Sep 27, 2012 at 9:25 AM,  <Christian.Schulenberg@bmw.de> wrote:
> I used the meta.ivi layer in combination with meta-ti before in a much ol=
der version, which worked fine for me, but at the moment I have no idea wha=
t's wrong with my configuration.

Maybe it's not a problem with your config but just a kernel bug or a
faulty toolchain+kernel combination.

You can try to manually build a (recent) kernel and see if it boots,
if you need directions just ask.

Enrico

