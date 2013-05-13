Return-Path: <prvs=838ee2003=Christopher.Pow@honeywell.com>
Received: from de08ip008.honeywell.com (de08ip008.honeywell.com [199.61.24.27])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 52E45E0051D
	for <meta-ti@yoctoproject.org>; Mon, 13 May 2013 10:57:05 -0700 (PDT)
Received-SPF: Neutral (de08ip008.honeywell.com: domain of
	Christopher.Pow@honeywell.com does not assert whether or not
	10.216.34.43 is permitted sender) identity=mailfrom;
	client-ip=10.216.34.43; receiver=de08ip008.honeywell.com;
	envelope-from="Christopher.Pow@honeywell.com";
	x-sender="Christopher.Pow@honeywell.com";
	x-conformance=spf_only; x-record-type="v=spf1"
Received-SPF: None (de08ip008.honeywell.com: no sender
	authenticity information available from domain of
	postmaster@de08ex5001.global.ds.honeywell.com) identity=helo;
	client-ip=10.216.34.43; receiver=de08ip008.honeywell.com;
	envelope-from="Christopher.Pow@honeywell.com";
	x-sender="postmaster@de08ex5001.global.ds.honeywell.com";
	x-conformance=spf_only
X-SBRS: None
X-SenderGroup: Relay_to_Internet
X-MailFlowPolicy: $Relay
X-Attachment_Filename: 
X-Attachment_Filesize: None
X-IronPort-AV: E=Sophos;i="4.80,747,1344236400"; d="scan'208";a="18013559"
Received: from unknown (HELO de08ex5001.global.ds.honeywell.com)
	([10.216.34.43])
	by de08ip008.honeywell.com with ESMTP; 13 May 2013 10:57:04 -0700
Received: from DE08EX3002.global.ds.honeywell.com ([169.254.2.234]) by
	de08ex5001.global.ds.honeywell.com ([10.216.14.56]) with mapi id
	14.02.0309.002; Mon, 13 May 2013 13:57:04 -0400
From: "Pow, Christopher (SWCOE)" <Christopher.Pow@honeywell.com>
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Thread-Topic: TI SysLink for am180-evm target
Thread-Index: AQHOUANGO7z4DcnQ10+nDe5adcSJ2A==
Date: Mon, 13 May 2013 17:57:03 +0000
Message-ID: <7B8A37CE7777314D9B931CDD3BA8C83B1B9F6A72@de08ex3002.global.ds.honeywell.com>
References: <mailman.0.1368467467.29286.meta-ti@yoctoproject.org>
In-Reply-To: <mailman.0.1368467467.29286.meta-ti@yoctoproject.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [146.167.150.119]
MIME-Version: 1.0
X-CFilter-Loop: Forwarded
Subject: TI SysLink for am180-evm target
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
X-List-Received-Date: Mon, 13 May 2013 17:57:05 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I am trying to integrate the TI Syslink package into a Yocto BSP.  So far I=
 have not been successful.  I have found and downloaded the cgt_c6000 binar=
y installer, but can't figure out how to modify the BitBake recipe to point=
 to it.  [bitbake ti-syslink errors on the fetch phase even though the SRC =
URI has been modified to point to the downloaded installer binary.]  Also I=
 am unable to find a download link for the TMS470 compiler, which seems to =
be another dependency for SysLink.  Has anyone successfully integrated the =
TI SysLink recipe?  Would it be easier to download and build SysLink separa=
tely and just install it on top of the targetfs?

I am trying to meet a very demanding schedule so I'd appreciate any help an=
yone can provide.

Thanks!

Christopher S. Pow
Senior Engineer, Systems
Honeywell SWCOE - RTOS
o: 612-951-5852
c: 612-910-1271


