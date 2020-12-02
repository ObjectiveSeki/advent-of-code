
import XCTest


struct ReportRepair {
    func expenceDouble(array: [Int]) -> Int {
        for x in array {
            for y in array {
                if x + y == 2020 {
                    return x * y
                }
            }
        }
        return 0
    }
    func expenceTripple(array: [Int]) -> Int {
        for x in array {
            for y in array {
                for z in array {
                    if x + y + z == 2020 {
                        return x * y * z
                    }
                }
            }
        }
        return 0
    }
}

class Tests_iOS: XCTestCase {

    override func setUpWithError() throws { }

    override func tearDownWithError() throws { }

    func testOne() {
        let array = [
            1721,
            979,
            366,
            299,
            675,
            1456,
        ]
        let result = ReportRepair().expenceDouble(array: array)
        XCTAssertEqual(result, 514579)
    }

    func testTwoo() {
        let array = [
            1721,
            979,
            366,
            299,
            675,
            1456,
        ]
        let result = ReportRepair().expenceTripple(array: array)
        XCTAssertEqual(result, 241861950)
    }

    func testPart1() {
        let result = ReportRepair().expenceDouble(array: input)
        print(result)
        XCTAssertNotEqual(result, 0)
    }

    func testPart2() {
        let result = ReportRepair().expenceTripple(array: input)
        print(result)
        XCTAssertNotEqual(result, 0)
    }

    let input = [
        1742,
        1763,
        1238,
        1424,
        1736,
        1903,
        1580,
        1847,
        1860,
        1933,
        1779,
        1901,
        1984,
        1861,
        1769,
        1896,
        1428,
        2010,
        1673,
        1491,
        1996,
        1746,
        1973,
        1696,
        1616,
        2006,
        1890,
        1600,
        1991,
        1724,
        1804,
        1794,
        462,
        1706,
        2002,
        1939,
        1834,
        1312,
        1943,
        1465,
        1405,
        1459,
        1659,
        1288,
        1241,
        1935,
        1294,
        1388,
        1772,
        1945,
        1649,
        813,
        1956,
        1274,
        1686,
        1404,
        1770,
        1631,
        1366,
        1321,
        1353,
        1685,
        1365,
        1738,
        1911,
        1235,
        1495,
        1837,
        1456,
        1283,
        1929,
        1326,
        1735,
        1604,
        1223,
        1261,
        1844,
        1850,
        1429,
        277,
        1848,
        1818,
        1395,
        1522,
        1863,
        1475,
        1562,
        1351,
        1538,
        1313,
        1416,
        1690,
        1539,
        1338,
        1982,
        1297,
        1821,
        780,
        1859,
        1420,
        1934,
        1303,
        1731,
        1714,
        1702,
        1417,
        1872,
        1998,
        1908,
        1957,
        1270,
        1359,
        1760,
        1997,
        1773,
        2000,
        1203,
        1880,
        1955,
        1273,
        1775,
        1893,
        1237,
        1707,
        1885,
        1900,
        1801,
        1367,
        1561,
        1524,
        1678,
        1511,
        1623,
        1464,
        1477,
        1733,
        1423,
        1575,
        1851,
        2007,
        1651,
        804,
        1836,
        1849,
        1713,
        1401,
        1502,
        1806,
        1506,
        1646,
        1968,
        1253,
        1889,
        1759,
        1734,
        1611,
        1558,
        1256,
        1657,
        1778,
        1953,
        1578,
        1717,
        1498,
        1381,
        1919,
        1512,
        1391,
        384,
        1802,
        1573,
        1940,
        1323,
        2003,
        1689,
        1936,
        1368,
        1962,
        1964,
        1586,
        1619,
        1482,
        1445,
        372,
        1792,
        96,
        1468,
        1999,
        1301,
        1757,
        1613,
        1807,
        1941,
        1642,
        1557,
        1884,
        1626,
        489,
        1989,
        1327,
    ]
}
