Received: from esa1.mentor.iphmx.com (esa1.mentor.iphmx.com [68.232.129.153])
 by mx.groups.io with SMTP id smtpd.web11.8516.1644926614710147125
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 15 Feb 2022 04:03:35 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: mentor.com, ip: 68.232.129.153, mailfrom: awais_belal@mentor.com)
IronPort-SDR: jh+fRaG+POBYnvDBJTN0bQI4WhXzFIwFm70bfySwbtEPbtYOlnxSF6colYLGasmc1QsXu3/txe
 WPJ0MWTA4GyuybHalu4tc9qfa8I0K/W6zXHhNqhaqhKlA77qAP+VAg/nhtleuu2XAmDWVhhEFT
 oF0o9Gg0xbbJ2yv+/iYe4bkiwAj18VqWO7x0dqh8k846PF/Ws9EbVcc4jL7Uh19UBj1zOCSoMf
 pjiBCsVNkd5j0PFo3fILZk7tAr/UcVzODvUrrojArhux/ehTiVwPtpIIiSdj6R6RrLlKpDUsT8
 l+4gMojOAq138zguCdhUXfDu
X-IronPort-AV: E=Sophos;i="5.88,370,1635235200"; 
   d="scan'208";a="74564037"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa1.mentor.iphmx.com with ESMTP; 15 Feb 2022 04:03:34 -0800
IronPort-SDR: QkVRH1TXkR00BPLwVcPFX3NAgKyxIePjzlunJxCXltyloIUQsS2t5eAsX6F0baK14ZLjePU0T8
 PIFcuYNbg491eih7hrEuQliNQ7sQGpaCld80Xr5Ra+KBpoNQNdPKoe8tjOhJexFW2oTKVB3ZEl
 MRO2wGjbwrYMW4pUxoZDzMjrE7UZXAaR+liXF6uzPzuoVHZn03IpUzY/yBaMrNVPvj4hEAYU87
 Bxe86DUJY0OJgphqx4Oq9UvHjo8mrt1BrHpTlNIKReBxddUr2JFM0krxwErpnNwok3t5hta0Oe
 z4k=
From: "Awais Belal" <Awais_Belal@mentor.com>
To: Denys Dmytriyenko <denis@denix.org>
CC: "meta-ti@lists.yoctoproject.org" <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti] [PATCH] ti-rtos-firmware: use nonarch_base_libdir for deployment
Thread-Topic: [meta-ti] [PATCH] ti-rtos-firmware: use nonarch_base_libdir for
 deployment
Thread-Index: AQHYIe3BAln4hdcgmEu9Ki/UAwXJ4qyUhACj
Date: Tue, 15 Feb 2022 12:03:29 +0000
Message-ID: <1644926609647.74074@mentor.com>
References: <20220202141641.32664-1-awais_belal@mentor.com>,<20220214215644.GH26229@denix.org>
In-Reply-To: <20220214215644.GH26229@denix.org>
Accept-Language: en-US, en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [137.202.0.90]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Denys,=0A=
=0A=
> Thanks, ti-rtos-firmware is just one of many other places where this need=
s to=0A=
> be fixed.=0A=
=0A=
> Since this is for master, I'll take it into my new WIP master tree and ex=
tend=0A=
> it to other FW recipes...=0A=
=0A=
Yeah, I was thinking of doing the same in steps depending on the response I=
'd get here but I guess you can pick this up now :)=0A=
=0A=
BR,=0A=
Awais=
