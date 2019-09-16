Return-Path: <prvs=15513378b=Kevin.E.Cribbs@L3Harris.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D0E08E00A49; Mon, 16 Sep 2019 12:40:54 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [166.20.51.117 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from smtp6out.l-3com.com (smtp6out.l-3com.com [166.20.51.117])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6CD04E008E3
	for <meta-ti@yoctoproject.org>; Mon, 16 Sep 2019 12:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=l3harris.com; i=@l3harris.com; q=dns/txt; s=mail1;
	t=1568662853; x=1600198853;
	h=from:to:cc:date:message-id:references:in-reply-to:
	mime-version:content-transfer-encoding:subject;
	bh=8Wozm6PTOkqShNIEoPxgW+FpTKSOlMqhIWWb2cls9MM=;
	b=rJPiN0glWmmmXOgxs+kWt1wltYDnZud0U3SAImxovtS7pYmx1aFHQDq3
	J+bJ2lhEhMX1kWbRdvTMjFUG5Jm6ApW6FXM8hV7p5LTOUnoAEkLe2HMEu
	0AahdxEhisfww+RRfjmvkWtVcEaMa/x2MWxWScTWKaAgeBGLsPBH/KG20
	r7oWmglnLU8O7IqRLo6sqU0Uyscv/fpAQROX75vZz6qbDEF8vfWzQK4sl
	qYyK0THI97MyOtoGrHSF2lNMEouHCvZO+Shf2EAwdBiBuvXayofdbu3sx
	Yeskm3yYPefwOdMe1Sc+bWmWfNUV2sznQODcdJlsL4irk+T7LJHrMQwTk w==;
X-filenames: 
X-filesizes: None
X-filetypes: 
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,513,1559520000"; d="scan'208";a="424281184"
X-L3Internal: true
Received: from ex10dag01azusva.rootforest.com (HELO mail.l3t.com)
	([141.199.128.140])
	by smtp6out.l-3com.com with ESMTP; 16 Sep 2019 19:40:51 +0000
Received: from EX12DAG01AZUSVA.rootforest.com (141.199.128.142) by
	EX10DAG01AZUSVA.rootforest.com (141.199.128.140) with Microsoft SMTP
	Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
	15.1.1713.5; Mon, 16 Sep 2019 19:40:49 +0000
Received: from USG02-BN3-obe.outbound.protection.office365.us (23.103.199.144)
	by smtp.l3t.com (141.199.128.142) with Microsoft SMTP Server
	(version=TLS1_2, 
	cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via
	Frontend Transport; Mon, 16 Sep 2019 19:40:49 +0000
Received: from CY1P110MB0470.NAMP110.PROD.OUTLOOK.COM (52.145.1.138) by
	CY1P110MB0086.NAMP110.PROD.OUTLOOK.COM (23.103.15.217) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2241.26; Mon, 16 Sep 2019 19:40:47 +0000
Received: from CY1P110MB0470.NAMP110.PROD.OUTLOOK.COM
	([fe80::c82b:7d59:7f61:ead0]) by CY1P110MB0470.NAMP110.PROD.OUTLOOK.COM
	([fe80::c82b:7d59:7f61:ead0%11]) with mapi id 15.20.2136.029;
	Mon, 16 Sep 2019 19:40:47 +0000
From: <Kevin.E.Cribbs@L3Harris.com>
To: <denys@ti.com>
Thread-Topic: [EXT] Re: [meta-ti] meta-ti (a345e0c2) Linux kernel fails to
	boot on Beagleboard-xM (rev C)
Thread-Index: AdVpe0LdIvib1Q0MQVWJHkv1VVoaYwDOPXsAAAMlTnA=
Date: Mon, 16 Sep 2019 19:40:47 +0000
Message-ID: <CY1P110MB04708DC82C9E823CF02684A4E88C0@CY1P110MB0470.NAMP110.PROD.OUTLOOK.COM>
References: <CY1P110MB04703E6886F03EF65BC06EFFE8B00@CY1P110MB0470.NAMP110.PROD.OUTLOOK.COM>
	<20190916172857.GE26975@beryl>
In-Reply-To: <20190916172857.GE26975@beryl>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Kevin.E.Cribbs@L3Harris.com; 
x-originating-ip: [166.20.23.204]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cb255cdc-c3d0-4435-e000-08d73addc58d
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
	SRVR:CY1P110MB0086; 
x-ms-traffictypediagnostic: CY1P110MB0086:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <CY1P110MB00860610671183AEA96773E2E88C0@CY1P110MB0086.NAMP110.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0162ACCC24
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(366004)(199004)(189003)(13464003)(55016002)(26005)(5660300002)(6246003)(6306002)(9686003)(8676002)(81166006)(102836004)(305945005)(53936002)(7736002)(66446008)(53546011)(81156014)(66946007)(99286004)(8936002)(74316002)(486006)(71190400001)(33656002)(71200400001)(7696005)(6916009)(52536014)(76176011)(25786009)(966005)(14444005)(256004)(66556008)(6506007)(66476007)(76116006)(86362001)(64756008)(11346002)(446003)(14454004)(476003)(498600001)(3846002)(6116002)(66066001)(186003)(4326008)(229853002)(2906002)(6436002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CY1P110MB0086;
	H:CY1P110MB0470.NAMP110.PROD.OUTLOOK.COM; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:3; MX:3; 
x-ms-exchange-senderadcheck: 1
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: cb255cdc-c3d0-4435-e000-08d73addc58d
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2019 19:40:47.0808 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: ba488c5e-f105-4a2b-a8b1-b57b26a44117
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Kevin.E.Cribbs@cse.L3T.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1P110MB0086
X-OriginatorOrg: L3Harris.com
Cc: meta-ti@yoctoproject.org
Subject: Re: meta-ti (a345e0c2) Linux kernel fails to boot on Beagleboard-xM (rev C)
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
X-List-Received-Date: Mon, 16 Sep 2019 19:40:54 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

If I understand correctly, you are saying the beagleboard MACHINE should ca=
use a working mainline LTS kernel (e.g. 4.19) to be built. It looks like gi=
t://git.ti.com/ti-linux-kernel/ti-linux-kernel.git pulls kernels (e.g. 4.19=
.73) from git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git so=
 the git URL doesn't need changed.

It will be at least a day before I test a mainline kernel/build.


Regarding your " any issues using a mainline kernel for your platform " que=
stion ...

I did find a problem in the TI TPS65950 chip device driver code: "drivers/m=
fd/twl-core.c". The "twl_i2c_read_u8(TWL4030_MODULE_INTBR, &temp, REG_GPPUP=
DCTR1);" and two lines that immediately follow should only be executed for =
boards that use external I2C pull ups. Boards that rely on the TPS65950 int=
ernal I2C pull ups (that are on by default) can no longer use the TSP65950 =
I2C buses after the pull ups are disabled. Since the presence/absence of ex=
ternal pull ups cannot be detected and boards without external pull ups fai=
l to operate after disabling the pull ups, they should only be disabled if =
a device tree property indicates they should be disabled.

Sorry for the rushed response. I'm using a remote connection that isn't wor=
king very well.


Kevin Cribbs
Principal Member Engineering Staff
INTEGRATED MISSION SYSTEMS / L3HARRIS TECHNOLOGIES
t +1 856 338 3763
L3Harris.com / kevin.e.cribbs@L3Harris.com
1 Federal Street / Camden, NJ 08103 / USA


-----Original Message-----
From: Denys Dmytriyenko <denys@ti.com> =

Sent: Monday, September 16, 2019 1:29 PM
To: Cribbs, Kevin E (US) @ CSG - CSE <Kevin.E.Cribbs@L3Harris.com>
Cc: meta-ti@yoctoproject.org
Subject: [EXT] Re: [meta-ti] meta-ti (a345e0c2) Linux kernel fails to boot =
on Beagleboard-xM (rev C)

On Thu, Sep 12, 2019 at 03:14:33PM +0000, Kevin.E.Cribbs@L3Harris.com wrote:
> I created a Yocto Project Bugzilla bug (13517) for this problem. Randy =

> MacLeod said "meta-ti is not tracked in this bugzilla. Please contact =

> the BSP owner".

> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D13517
> =

> What is the correct procedure for reporting problems with the meta-ti lay=
er?

Kevin,

Thank you for the report.

Regarding the use of Yocto Project bugzilla for metat-ti bugs - I've discus=
sed this with fellow Yocto Project TSC members and there's a confusion caus=
ed by limited resources. We'll try to get this sorted out...

Meanwhile, as of the booting issue itself. As you can see, meta-ti uses TI =
"staging" tree, where active development for current and latest platforms h=
appens during the upstreaming process. OMAP3 SOC is 10-15 years old and wha=
t is called a legacy device. It has been fully supported in mainline Linux =
kernel for many years. Yes, TI is also responsible for maintaining existing=
 support in the mainline kernel and ensuring no regressions. But that is no=
t against the TI "staging" tree - i.e. there's no active testing being done=
 of meta-ti working on OMAP3 platforms like Beagleboard-xM, unfortunately. =
This is left to corresponding communities, such as Beagleboard.org

I'll see what I can do to get this looked at in meta-ti. Otherwise, do you =
see any issues using a mainline kernel for your platform? Thanks.

--
Denys

  =


CONFIDENTIALITY NOTICE: This email and any attachments are for the sole use=
 of the intended recipient and may contain material that is proprietary, co=
nfidential, privileged or otherwise legally protected or restricted under a=
pplicable government laws. Any review, disclosure, distributing or other us=
e without expressed permission of the sender is strictly prohibited. If you=
 are not the intended recipient, please contact the sender and delete all c=
opies without reading, printing, or saving.



