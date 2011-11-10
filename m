Return-Path: <jdk@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CBD04E00307
	for <meta-ti@yoctoproject.org>; Thu, 10 Nov 2011 04:42:37 -0800 (PST)
Received: from dlep36.itg.ti.com ([157.170.170.91])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id pAACganK005927
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 10 Nov 2011 06:42:36 -0600
Received: from dlep26.itg.ti.com (smtp-le.itg.ti.com [157.170.170.27])
	by dlep36.itg.ti.com (8.13.8/8.13.8) with ESMTP id pAACgake023894;
	Thu, 10 Nov 2011 06:42:36 -0600 (CST)
Received: from DFLE70.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id pAACga5a018914;
	Thu, 10 Nov 2011 06:42:36 -0600 (CST)
Received: from DFLE34.ent.ti.com ([fe80::c12:d795:2e56:2d02]) by
	DFLE70.ent.ti.com ([fe80::db3:609a:aa62:e1ec%22]) with mapi id
	14.01.0323.003; Thu, 10 Nov 2011 06:42:36 -0600
From: "Kridner, Jason" <jdk@ti.com>
To: Koen Kooi <koen@dominion.thruhere.net>, "Fernandes, Joel A"
	<joelagnel@ti.com>
Thread-Topic: [meta-ti] [PATCH] gadget-init: Add network-gadget services and
	other fixes
Thread-Index: AQHMn28pH455jVRndU2hyas23w1q8JWmYESA//+s3bo=
Date: Thu, 10 Nov 2011 12:42:35 +0000
Message-ID: <F61A9010E56D7F4C93A19FD36DAAC3590C3E41@DFLE34.ent.ti.com>
References: <1320905196-2476-1-git-send-email-joelagnel@ti.com>
	<083BC63EECB6FD41B8E81CF7FD87CC0F04465D@DLEE09.ent.ti.com>,
	<86203E75-5767-4DC0-B188-7955E69DAE3D@dominion.thruhere.net>
In-Reply-To: <86203E75-5767-4DC0-B188-7955E69DAE3D@dominion.thruhere.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>, "Kipisz,
	Steven" <s-kipisz2@ti.com>
Subject: Re: [PATCH] gadget-init: Add network-gadget services and	other fixes
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
X-List-Received-Date: Thu, 10 Nov 2011 12:42:38 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Please forgive the OWA top-post.=0A=
=0A=
I'm not sure why I wasn't seeing this 2 days ago.  Good news is if we fix t=
his, we probably fix g_multi as well.  I'm thinking we probably still need =
to boot with g_mass_storage to enable driver installation because I'm prett=
y sure g_multi requires drivers on Windows, but we can test that out.  Not =
switching drivers would be so much nicer.=0A=
=0A=
Regards,=0A=
Jason=0A=
________________________________________=0A=
From: meta-ti-bounces@yoctoproject.org [meta-ti-bounces@yoctoproject.org] o=
n behalf of Koen Kooi [koen@dominion.thruhere.net]=0A=
Sent: Thursday, November 10, 2011 6:38 AM=0A=
To: Fernandes, Joel A=0A=
Cc: meta-ti@yoctoproject.org=0A=
Subject: Re: [meta-ti] [PATCH] gadget-init: Add network-gadget services and=
     other fixes=0A=
=0A=
Op 10 nov. 2011, om 07:08 heeft Fernandes, Joel A het volgende geschreven:=
=0A=
=0A=
>> -----Original Message-----=0A=
>> From: Fernandes, Joel A=0A=
>> Sent: Thursday, November 10, 2011 12:07 AM=0A=
>> To: meta-ti@yoctoproject.org=0A=
>> Cc: Fernandes, Joel A; Kridner, Jason=0A=
>> Subject: [PATCH] gadget-init: Add network-gadget services and other=0A=
>> fixes=0A=
>=0A=
>=0A=
> Sorry, the title is supposed to have "PATCH v2" prefixed.=0A=
=0A=
=0A=
I've applied this patch and ran some tests. It pretty much works as expecte=
d, but I had to make some small cleanups to make the logic work a bit bette=
r. The showstopper is that g_ether, like g_multi will take up 100% cpu in r=
cu_kthread when loaded :(=0A=
=0A=
regards,=0A=
=0A=
Koen=0A=

