Return-Path: <sarvesh.patkar@thermofisher.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C81BBE0074B; Fri, 31 Aug 2018 11:46:25 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [208.86.201.75 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
X-Greylist: delayed 2970 seconds by postgrey-1.32 at yocto-www;
	Fri, 31 Aug 2018 11:46:24 PDT
Received: from mx0b-002a2102.pphosted.com (mx0b-002a2102.pphosted.com
	[208.86.201.75])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 75925E005B1
	for <meta-ti@yoctoproject.org>; Fri, 31 Aug 2018 11:46:24 -0700 (PDT)
Received: from pps.filterd (m0104973.ppops.net [127.0.0.1])
	by mx0a-002a2102.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
	w7VHdFJf139154; Fri, 31 Aug 2018 17:56:53 GMT
Received: from nam05-by2-obe.outbound.protection.outlook.com
	(mail-by2nam05lp0246.outbound.protection.outlook.com
	[216.32.181.246])
	by mx0a-002a2102.pphosted.com with ESMTP id 2m6eer8gms-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
	Fri, 31 Aug 2018 17:56:52 +0000
Received: from BN6PR07MB3585.namprd07.prod.outlook.com (10.161.153.151) by
	BN6PR07MB3154.namprd07.prod.outlook.com (10.172.105.136) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1080.16; Fri, 31 Aug 2018 17:55:54 +0000
Received: from BN6PR07MB3585.namprd07.prod.outlook.com
	([fe80::f99b:41e9:427d:d67]) by BN6PR07MB3585.namprd07.prod.outlook.com
	([fe80::f99b:41e9:427d:d67%2]) with mapi id 15.20.1080.019;
	Fri, 31 Aug 2018 17:55:54 +0000
From: "Patkar, Sarvesh S." <sarvesh.patkar@thermofisher.com>
To: Denys Dmytriyenko <denys@ti.com>
Thread-Topic: [meta-ti] BeagleBone Black: cannot access USB MSC devices
Thread-Index: AdRA0Cz8Ln8SNU5FRUaFx/jzxarsxgAA/eCAAB+Z4QA=
Date: Fri, 31 Aug 2018 17:55:53 +0000
Message-ID: <BN6PR07MB35851F8B59EB14B18FC5FBC6E40F0@BN6PR07MB3585.namprd07.prod.outlook.com>
References: <BN6PR07MB3585011B103A75E5F1964AF3E40F0@BN6PR07MB3585.namprd07.prod.outlook.com>
	<20180831024139.GN11110@beryl>
In-Reply-To: <20180831024139.GN11110@beryl>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [208.184.154.60]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; BN6PR07MB3154;
	6:woAJ1DkL5rHc8pX/zZ+7D0lX+NOKUSiLF7pd/Dfda2umsGXvbkDZYEu9Vqf0G5hA9wB6jYgtIvmf2iEd7Lh1nxhuE+ZNzuxYkqQJ8j85DqKONcPQ5EL34n+vGdyPncSRr3SFDSqywCFFcHqFjsn6GEbdSy5QHr/E8Q7BiKzVsN2V9V4Mdd0KeZrUpMvYIno4R76v1UVCAkVqAcH6Y9zfyN5t//DF2uMNOxluVimrwC/0k7mv5vEswsNmhAwd5TcpAMHJq49Tl6/lAQ8hzxQyuFuihnFxeQ1WJ/YHsj6JtL/5Myt4wsbdx0NHgb4MT4+x531TPsDBn3h7LnAvEGi+z4mK57DHN8aoSv0aGPrW1XF7eZVACeD22PkxGM9oWbW6JiNLwciNour5A2nAhO2XTejaFrZNYA2uAdh4sYZmzYhGihN3r4wfeLGXoGzL/RSi+sx4qCJrtEacIvuIubB0FQ==;
	5:ebuYg4dNJPYj+AzYwlpgPUWfuXq09EFZgqc4z+v5oQqWEmME87OhQ5Cmz4ne25rB9cuL7/XJkw4HTagGM9vXKnNhxb1a2MJQ3t4b4+Hre3Zahw1Ok+6jVV/MzJeG5obz0YDL2ljIGTe4BblSE55ym3ez65AklfJpMqCwyET7Ktk=;
	7:3aeB9ErizbOPPNXzSCUm1FcvE053CPdJ8A6TVeJBlGoAFgibqz/hJsglDDKpZ64IXzW3kly3dUZ9N4yRrI/xUVZjWrUkGPBcpnj0OoNPIAsuKLrujHNjxBsMg2y0gWxwaNh5d+BWpePYwcLdZ673eC5klW/1yfN5otUo4zSrXYib/5xxJCALcvkbhzrAiBcZ2mAVtm0as4h2cj+OfgqdR7hlwi3shzhGnpMjOt9EtFuL6tYN/kzNreUok72S3dwU
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: b83f9932-5927-4870-4c77-08d60f6aff2a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989137)(4534165)(4627221)(201703031133081)(201702281549075)(8990107)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:BN6PR07MB3154; 
x-ms-traffictypediagnostic: BN6PR07MB3154:
x-microsoft-antispam-prvs: <BN6PR07MB3154A19F567D1E2BFCAAD98EE40F0@BN6PR07MB3154.namprd07.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(31051911155226)(10436049006162)(183277255680310)(142551309573705);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3002001)(93006095)(93001095)(10201501046)(3231311)(944501410)(52105095)(6055026)(149027)(150027)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(20161123558120)(20161123562045)(20161123560045)(201708071742011)(7699016);
	SRVR:BN6PR07MB3154; BCL:0; PCL:0; RULEID:; SRVR:BN6PR07MB3154; 
x-forefront-prvs: 07817FCC2D
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(136003)(396003)(39860400002)(366004)(346002)(376002)(13464003)(51914003)(189003)(199004)(476003)(8936002)(68736007)(345774005)(102836004)(446003)(316002)(186003)(6116002)(3846002)(2906002)(106356001)(11346002)(25786009)(7696005)(99286004)(53546011)(486006)(6506007)(26005)(76176011)(33656002)(105586002)(5250100002)(4326008)(8676002)(81166006)(45954006)(53936002)(229853002)(14444005)(66066001)(81156014)(6246003)(217873002)(19627235002)(2900100001)(5660300001)(6916009)(55016002)(14454004)(6436002)(6306002)(86362001)(74316002)(9686003)(966005)(7736002)(256004)(305945005)(478600001)(97736004)(575784001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BN6PR07MB3154;
	H:BN6PR07MB3585.namprd07.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: thermofisher.com does not
	designate permitted sender hosts)
x-microsoft-antispam-message-info: K6Zte653sJkdDn8L+HGZ1SNbISNXLQbZ39D/ua3Yv7XB8D0JSajYhgQjZDc+EjW1w9yakL6XEx7EYEbqjb0kW+G0I4avukWYJNjbvLkzMRtViPlJc1L5ruu3lWW8vFeagoXl5Y7Tv0wGvF/fsPbWfG08kNTUmiN8Nf6D4QMrnLjNVi1Tn9Ut2Nj+x1eq3388xpzRpeBsJYcyAvx2Z+Q0VXMSngqL/UeAStT+47g6j3akBPIXdj8C1zsn48Emsp5CfaIvgwe0rN1eQi2TlZm5GJvkcjRhUSER6Ey+scIyFDmGslqiZ+93NwPq+8B0iKT6i7rNl/M6Hqbquo1GNjWUsNikTk77YlI+86qXPNjkqMQ=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: thermofisher.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b83f9932-5927-4870-4c77-08d60f6aff2a
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Aug 2018 17:55:53.9541 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b67d722d-aa8a-4777-a169-ebeb7a6a3b67
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR07MB3154
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2018-08-31_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	priorityscore=1501
	malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
	clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
	scancount=1 engine=8.0.1-1807170000 definitions=main-1808310179
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: BeagleBone Black: cannot access USB MSC devices
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
X-List-Received-Date: Fri, 31 Aug 2018 18:46:25 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Denys,

Thank you for the quick reply.

I tried the core-image-base. I see the following on the console.

root@beaglebone:~# lsusb
unable to initialize libusb: -99

fdisk doesn't list the USB device as well.=20

Is there anything else that I can try?

Thanks,
Sarvesh

-----Original Message-----
From: Denys Dmytriyenko [mailto:denys@ti.com]=20
Sent: Thursday, August 30, 2018 7:42 PM
To: Patkar, Sarvesh S. <sarvesh.patkar@thermofisher.com>
Cc: meta-ti@yoctoproject.org
Subject: Re: [meta-ti] BeagleBone Black: cannot access USB MSC devices


Please don't use core-image-minimal (e.g. core-image-base is much better), =
if you want to get anything useful out of it, besides just booting, includi=
ng such tools as fdisk, lsusb, etc. Thanks.


On Fri, Aug 31, 2018 at 02:16:09AM +0000, Patkar, Sarvesh S. wrote:
> Hi,
>
> I am a beginner in Yocto and still learning to configure the images=20
> generated.
>
> I am trying to use USB devices with the BeagleBone Black (Rev C) .
> Specifically, I want to access a Mass Storage Class Device (a USB=20
> Flash
> Drive) from the BeagleBone Black. I used the meta, meta-poky and=20
> meta-ti layers to build a core-image-minimal image for beaglebone=20
> machine. On booting up with the image, I do not see any obvious=20
> errors. However, it cannot detect the presence of a USB Device=20
> connected to it. I checked this using fdisk -l. lsusb command is not foun=
d.
>
> I went through an old email chain
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.yoctoprojec
> t.org_pipermail_linux-2Dyocto_2014-2DJune_002787.html&d=3DDwIBAg&c=3Dq6k2=
D
> sTcEGCcCb_WtVSz6hhIl8hvYssy7sH8ZwfbbKU&r=3DkLMtB9EeaG0D8_vJ7xCDnkGx5TX9d
> c8pLS0HaMWl2-A&m=3DZnXiBdSvO_0jYV33nEuRQrF7tLzUs8TgUM7hBC6IchQ&s=3DnMXUhO=
H
> LBBgCs7EOynlKAfyBNTlmCSJFY8uJm1C3cAY&e=3D
> to find if there was a solution. One of the things mentioned was to=20
> use menuconfig to configure the kernel for built-in USB support. But,=20
> I am not sure if the .config file is being picked up by bitbake.
>
> How do I enable USB support for MSC devices on BeagleBone Black?
>
> poky branch=3D sumo-19.0.0
> meta-ti branch=3D ti2018.02
>
> Thanks for the help!
> Sarvesh
>

> --
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org

