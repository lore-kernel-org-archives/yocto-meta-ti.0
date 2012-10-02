Return-Path: <prvs=36368f232a=christian.schulenberg@bmw.de>
Received: from mxout38.expurgate.net (mxout38.expurgate.net [194.37.255.38])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C0BA1E002AC
	for <meta-ti@yoctoproject.org>; Tue,  2 Oct 2012 01:03:42 -0700 (PDT)
Received: from [127.0.0.1] (helo=localhost)
	by relay.expurgate.net with smtp (Exim 4.77)
	(envelope-from <prvs=36368f232a=christian.schulenberg@bmw.de>)
	id 1TIxS4-0006TM-7d; Tue, 02 Oct 2012 10:03:36 +0200
Received: from [160.46.252.44] (helo=cmtamx3b.bmwgroup.com)
	by relay.expurgate.net with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.77) (envelope-from <Christian.Schulenberg@bmw.de>)
	id 1TIxS3-0007GP-6N; Tue, 02 Oct 2012 10:03:35 +0200
Received: from cmtabb2a.muc (cmtabb2a.muc [160.50.100.13])
	by cmtamx3a.bmwgroup.com (8.13.8/8.13.8) with ESMTP id q9283No4013732
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Tue, 2 Oct 2012 10:03:30 +0200
Received: from SMUCH05A.europe.bmw.corp (smuch05a.muc [160.50.20.10])
	by cmtabb2a.muc (8.13.8/8.13.8) with ESMTP id q9283EoP008416;
	Tue, 2 Oct 2012 10:03:15 +0200
Received: from SMUCM08V.europe.bmw.corp ([160.50.20.51]) by
	SMUCH05A.europe.bmw.corp ([160.50.20.10]) with mapi;
	Tue, 2 Oct 2012 10:03:15 +0200
From: <Christian.Schulenberg@bmw.de>
To: <ndec13@gmail.com>
Date: Tue, 2 Oct 2012 10:03:14 +0200
Thread-Topic: [meta-ti] pandaboard not booting
Thread-Index: Ac2db/Yn0CUPuQ56RAGNSsaHR0q8KwDA5JNA
Message-ID: <EF446FF9DAC93B479C74AB9153DE173F111ED59F@SMUCM08V.europe.bmw.corp>
References: <EF446FF9DAC93B479C74AB9153DE173F1117CA4D@SMUCM08V.europe.bmw.corp>
	<CA+2YH7vSDK0CS6Yh1pu26qygOhiKZycA0or7EXtF-Z09ntQvjw@mail.gmail.com>
	<EF446FF9DAC93B479C74AB9153DE173F1117CBFB@SMUCM08V.europe.bmw.corp>
	<CAMKF1sojfxBhzj-4K7j77Jdv5zhJQ9g3A2XBQ4CxkdUhy=se4g@mail.gmail.com>
	<506479FF.8050305@mlbassoc.com>
	<CAMKF1sp1dD7qoaQ=JpM_RmgZS65GRKcUcBka9q=0TWbtAzEVHQ@mail.gmail.com>
	<CA+2YH7ssSvi323th0dHxP_wzB9H7he23HuhvtKNbAzb+K_n-Fg@mail.gmail.com>
	<20120927162455.GA7653@edge> <50647F76.6020109@mlbassoc.com>
	<CAOT3miL737wkzsNdfO38VrYJMf5K57-g3_ZCQji_HV0+y56b3A@mail.gmail.com>
	<20120927212854.GB7653@edge>
	<EF446FF9DAC93B479C74AB9153DE173F1117D228@SMUCM08V.europe.bmw.corp>
	<CAOT3miJcBnfy0S0QHiSWYcs8oQAcWzukH5zWW3ofbBdNiPSu-A@mail.gmail.com>
In-Reply-To: <CAOT3miJcBnfy0S0QHiSWYcs8oQAcWzukH5zWW3ofbBdNiPSu-A@mail.gmail.com>
Accept-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: de-DE
MIME-Version: 1.0
X-Spam-Status: No, No
X-purgate-relay-fid: relay-5443cb
X-purgate-sourceid: 1TIxS3-0007GP-6N
X-purgate-Ad: Checked for spam and viruses by eXpurgate(R),
	see www.eleven.de for details.
X-purgate-ID: 151534::1349165015-00002241-65679A0B/0-0/0-0
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
X-List-Received-Date: Tue, 02 Oct 2012 08:03:43 -0000
Content-Language: de-DE
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

thanks for the hint to use kernel 3.4.

I updated my meta-ti layer to use kernel 3.4.11 and it works fine for me no=
w. I tested this with gcc 4.7.1 as well as gcc 4.6.3

Bets regards,
Christian

-----Urspr=FCngliche Nachricht-----
Von: Nicolas Dechesne [mailto:ndec13@gmail.com]=20
Gesendet: Freitag, 28. September 2012 13:54
An: Schulenberg Christian, EI-42
Cc: denys@ti.com; meta-ti@yoctoproject.org
Betreff: Re: [meta-ti] pandaboard not booting

On Fri, Sep 28, 2012 at 1:03 PM,  <Christian.Schulenberg@bmw.de> wrote:
> Hi,
>
> could you give me some advice, what kernel version of 3.4.x to try? Or do=
 you have an idea, when a recipe for a more recent kernel could be availabl=
e?

http://git.linaro.org/gitweb?p=3Dlanding-teams/working/ti/kernel.git
branch: tilt-3.4
config: omap4plus_defconfig


>
> BR,
> Christian
>
> -----Urspr=FCngliche Nachricht-----
> Von: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-bounces@yoctoprojec=
t.org] Im Auftrag von Denys Dmytriyenko
> Gesendet: Donnerstag, 27. September 2012 23:29
> An: Nicolas Dechesne
> Cc: meta-ti@yoctoproject.org
> Betreff: Re: [meta-ti] pandaboard not booting
>
> On Thu, Sep 27, 2012 at 11:15:55PM +0200, Nicolas Dechesne wrote:
>> On Thu, Sep 27, 2012 at 6:31 PM, Gary Thomas <gary@mlbassoc.com> wrote:
>> > I build the Panda kernel (based on the latest TI/Ubuntu tree
>> > ti-ubuntu-3.4-1485.7 branch)
>> > all the time with the Yocto toolchain & it works just fine.
>> >
>> > I also tried the off-the-shelf 3.1.0 which worked as well.
>> >
>> > There must be something odd about the 3.1 kernel built from the
>> > linux-omap4-3.1.0
>> > recipe which is the default when built using Yocto+meta-ti
>>
>> i don't think there should be any valid reason to continue with this
>> old kernel. first there isn't anyone who maintains that branch (my
>> team maintains that evil vendor tree). For Panda I would either
>> recommend to use to a more recent branch (like 3.4), in fact we might
>> even consider http://git.linaro.org/gitweb?p=3Dlanding-teams/working/ti/=
kernel.git
>> (branch tilt-3.4) as this is the base for our 'ubuntu' derived branch.
>> in fact for Panda, just mainline might be another option too..
>
> Thanks, Nicolas!
>
> I'll give it a try with either of those trees and update the recipe
> accordingly.
>
> --
> Denys
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

